import csv
import xmltodict
import os
import re
from collections import defaultdict

import jellyfish
from django.conf import settings
from django.core.management.base import BaseCommand

from bsyncviewer.lib.bedes.bedes_parser import BedesParser
from bsyncviewer.models.attribute import Attribute
from bsyncviewer.models.bedes_models import BedesTerm, BedesMapping, BedesEnumeration, \
    BedesEnumerationMapping
from bsyncviewer.models.enumeration import Enumeration
from bsyncviewer.models.schema import Schema

# MATCH TYPES:
# Term-to-List-Option Match -> use bedes_url col (will contain only 1 URL)
# Term-to-Term Match -> use bedes_url col (will contain only 1 URL)
# Words: all Term -> use matched_term_URL col (could be a list of URLs)
# Words: all Unmatched -> DO NOTHING
# Words: all Word -> use matched_word_example_URL col, (could be a list of URLs)
# Words: Term, Unmatched -> use matched_term_URL col, (could be a list of URLs)
# Words: Term, Word -> use BOTH matched_word_example_URL AND matched_term_URL
# Words: Term, Word, Unmatched -> use BOTH matched_word_example_URL AND matched_term_URL
# Words: Word, Unmatched -> use matched_word_example_URL (could be a list of URLs)


class Command(BaseCommand):
    help = 'Closes the specified poll for voting'

    def add_arguments(self, parser):
        parser.add_argument('--schema_version', type=str, default=settings.DEFAULT_SCHEMA_VERSION)
        parser.add_argument('--bedes_version', type=str, default='v2.2')
        parser.add_argument('--save_to_db', default=False, action="store_true")

    def handle(self, *args, **options):
        bedes_version = options['bedes_version']
        schema_version = options['schema_version']
        save_to_db = options['save_to_db']

        if save_to_db:
            self.stdout.write('Saving BEDES mappings to database')
            # if save_to_db is True, save CSV files to DB (don't reparse)
            self.save_mappings_to_database(bedes_version, schema_version)
        else:
            # do the parsing (only)
            self.stdout.write('Parsing BEDES data and matching to attributes')
            self.parse(bedes_version, schema_version)

    def parse(self, bedes_version, schema_version):
        # parse correct bedes version
        bedes = BedesParser(bedes_version)
        bedes.save()

        # self.stdout.write(bedes.terms)
        # self.stdout.write(bedes.categories)

        # check for manual mappings CSV file
        the_path = os.path.join(os.path.dirname(__file__), '../../lib/bedes', bedes_version)
        if not os.path.isfile("%s/manual_mapping_table.csv" % (the_path)):
            raise FileNotFoundError(
                "Cannot find the manual_mapping_table.csv file in lib/bedes/{} directory".format(
                    bedes_version))

        # read data from manual mappings CSV file and store in local dict variable
        csv_file = open("%s/manual_mapping_table.csv" % (the_path), mode='r')
        manual_mappings_file = csv.DictReader(csv_file)
        manual_mappings = {}
        for term in manual_mappings_file:
            manual_mappings[term['BSync String']] = term['BEDES String']

        # read the fields from the database, right now default to schema 0.3
        schema = Schema.objects.filter(version=schema_version).first()
        results = {}
        for attribute in schema.attributes.all().order_by('id'):
            # self.stdout.write(attribute.na)

            # use id as the key since name is not unique
            results[attribute.id] = []

            # run function to find and replace words that are in the manual mappings table
            bsync_term = self.manual_mapping(attribute.name, manual_mappings)

            for bt in bedes.terms:
                distance = jellyfish.jaro_winkler(bsync_term.lower(), bt['Term'].lower())

                if distance >= 0.98:
                    results[attribute.id].append({
                        "attribute_name": attribute.name,
                        "transformed_name": bsync_term,
                        "attribute_path": attribute.path,
                        "bedes_term": bt['Term'],
                        "bedes_object": bt,
                        "distance": distance,
                        "term_or_lo": 'Term'
                    })

            # if no matches found in BEDES terms, check list options
            if not results[attribute.id]:
                for be in bedes.enumerations:
                    # .lower() function used to neutralize upper/lower case discrepancies (there are many in enumerations/list options)
                    distance = jellyfish.jaro_winkler(bsync_term.lower(), be['List-Option'].lower())

                    if distance >= 0.98:
                        results[attribute.id].append({
                            "attribute_name": attribute.name,
                            "transformed_name": bsync_term,
                            "attribute_path": attribute.path,
                            "bedes_term": be['List-Option'],
                            "bedes_object": be,
                            "distance": distance,
                            "term_or_lo": 'List-Option'
                        })

            # sort matched terms by distance value (highest matched in first index position)
            results[attribute.id] = sorted(results[attribute.id], key=lambda k: -k['distance'])

            if not results[attribute.id]:
                # didn't find any term-to-term or term-to-list-option matches, start word-level matching

                words_data = defaultdict(list)

                bsync_words = []
                # split BSync term into a list of individual words
                bsync_words = self.acronym_check(re.findall('[^:^(^)^,^ ][^,^ ^:^(^)]*', bsync_term))

                # go through entire list, converting to an array that assigns an availability flag to each individual word
                for i in range(len(bsync_words)):
                    bsync_words[i] = [bsync_words[i], True]

                if len(bsync_words) > 2:
                    restart_process = True
                    while restart_process:
                        restart_process = False

                        # generate word groups, starting with largest groups first
                        for number_of_words in range(len(bsync_words) - 1, 1, -1):
                            word_groups = {}

                            # search through bsync_words for all possible combinations of word groups of proper length
                            # made up of concurrent words with availability flags set to True, save in dict word_groups
                            for starting_index in range(len(bsync_words) - number_of_words + 1):
                                word_construction = ''
                                word_construction_success = True
                                for i in range(starting_index, starting_index + number_of_words):
                                    if bsync_words[i][1]:
                                        word_construction += bsync_words[i][0] + ' '
                                    else:
                                        word_construction_success = False
                                        break
                                if word_construction_success:
                                    word_groups[word_construction.strip(' ')] = starting_index

                            # attempt to match each word group generated against BEDES terms and list options using jaro_winkler distance
                            for word_group in word_groups.keys():

                                for bt in bedes.terms:
                                    distance = jellyfish.jaro_winkler(word_group.lower(), bt['Term'].lower())

                                    if distance >= 0.98:

                                        for i in range(word_groups[word_group], word_groups[word_group] + number_of_words):
                                            bsync_words[i][1] = False

                                        words_data['matched_to_term'].append(word_group)
                                        words_data['matched_term_URL'].append(bt['URL'])
                                        words_data['term_or_lo'].append('Term')

                                        # start process to break out of loops, restart entire word grouping process (now with appropriate words unavailable for grouping)
                                        restart_process = True
                                        break

                                if restart_process:
                                    break
                                else:
                                    # if no matches found in BEDES terms, check list options
                                    for be in bedes.enumerations:

                                        distance = jellyfish.jaro_winkler(word_group.lower(), be['List-Option'].lower())

                                        if distance >= 0.98:
                                            for i in range(word_groups[word_group], word_groups[word_group] + number_of_words):
                                                bsync_words[i][1] = False

                                            words_data['matched_to_term'].append(word_group)
                                            words_data['matched_term_URL'].append(be['URL'])
                                            words_data['term_or_lo'].append('List-Option')

                                            # start process to break out of loops, restart entire word grouping process (now with appropriate words unavailable for grouping)
                                            restart_process = True
                                            break

                            if restart_process:
                                break

                # check through remaining individual words that weren't matched as part of a word group
                # individual words will only match 1-to-1 and will also search through individual words
                # of BEDES terms and list options for partial matches
                for i in range(len(bsync_words)):
                    if bsync_words[i][1]:
                        bsync_word = bsync_words[i][0]

                        # run word matching function against BEDES terms and list options (enumerations)
                        term_match_status, term_match_URL = self.word_matching(bsync_word, bedes.terms)
                        lo_match_status, lo_match_URL = self.word_matching(bsync_word, bedes.enumerations)

                        if term_match_status == 'Matched-Term':
                            words_data['matched_to_term'].append(bsync_word)
                            words_data['matched_term_URL'].append(term_match_URL)
                            words_data['term_or_lo'].append('Term')

                        else:
                            if lo_match_status == 'Matched-Term':
                                words_data['matched_to_term'].append(bsync_word)
                                words_data['matched_term_URL'].append(lo_match_URL)
                                words_data['term_or_lo'].append('List-Option')

                            else:
                                if term_match_status == 'Matched-Word':
                                    words_data['matched_to_word'].append(bsync_word)
                                    words_data['matched_word_example_URL'].append(term_match_URL)

                                else:
                                    if lo_match_status == 'Matched-Word':
                                        words_data['matched_to_word'].append(bsync_word)
                                        words_data['matched_word_example_URL'].append(lo_match_URL)

                                    else:
                                        words_data['unmatched_words'].append(bsync_word)

                results[attribute.id].append({
                    "attribute_name": attribute.name,
                    "transformed_name": bsync_term,
                    "attribute_path": attribute.path,
                    "word_matching": True,
                    "term_or_lo": words_data['term_or_lo'],
                    "matched_to_term": words_data['matched_to_term'],
                    "matched_term_URL": words_data['matched_term_URL'],
                    "matched_to_word": words_data['matched_to_word'],
                    "matched_word_example_URL": words_data['matched_word_example_URL'],
                    "unmatched_words": words_data['unmatched_words']
                })
        # self.stdout.write(results)

        # store the results to CSV
        the_path = os.path.join(os.path.dirname(__file__), '../../lib/bedes', bedes_version,
                                "schema" + schema_version)

        print("THE PATH: {}".format(the_path))
        if not os.path.exists(the_path):
            os.makedirs(the_path)

        unique_column_words = {}
        unique_column_words['matched_to_term'] = []
        unique_column_words['matched_to_word'] = []
        unique_column_words['unmatched_words'] = []
        content_uuids = []
        with open("%s/bedes-mappings-terms.csv" % (the_path), 'w', newline='') as file:
            writer = csv.writer(file, delimiter=',')

            # write row of column headers
            writer.writerow(
                ['attribute_name', 'transformed_name', 'attribute_id', 'attribute_path', 'bedes_content_uuid',
                 'bedes_term', 'bedes_category', 'bedes_definition', 'bedes_url', 'distance',
                 'match_type', 'matched_to_term', 'term_or_lo', 'matched_term_URL', 'matched_to_word', 'matched_word_example_URL', 'unmatched_words'])
            for id, be in results.items():
                if len(be) > 0 and 'bedes_object' in be[0]:
                    # 'if' structures to grab relevant information from appropriate fields depending on whether a term or a list option was matched
                    if be[0]['term_or_lo'] == 'Term':
                        output_category = be[0]['bedes_object']['Category']
                        output_definition = be[0]['bedes_object']['Term-Definition']
                        output_match_type = 'Term-to-Term Match'
                    elif be[0]['term_or_lo'] == 'List-Option':
                        output_category = ''
                        output_definition = be[0]['bedes_object']['List-Option-Definition']
                        output_match_type = 'Term-to-List-Option Match'

                    out = [be[0]['attribute_name'], be[0]['transformed_name'], id, be[0]['attribute_path'],
                           be[0]['bedes_object']['Content-UUID'], be[0]['bedes_term'],
                           output_category,
                           output_definition, be[0]['bedes_object']['URL'],
                           be[0]['distance'], output_match_type, '', '', '', '', '', '']
                    content_uuids.append(be[0]['bedes_object']['Content-UUID'])
                else:
                    # output word matching data if no direct term matches were found
                    if 'word_matching' in be[0]:

                        # determine the match type tag depending on the specific combination of word match types
                        if len(be[0]['matched_to_term']) > 0:
                            if len(be[0]['matched_to_word']) > 0:
                                if len(be[0]['unmatched_words']) > 0:
                                    output_match_type = 'Words: Term, Word, Unmatched'
                                else:
                                    output_match_type = 'Words: Term, Word'
                            elif len(be[0]['unmatched_words']) > 0:
                                output_match_type = 'Words: Term, Unmatched'
                            else:
                                output_match_type = 'Words: all Term'
                        elif len(be[0]['matched_to_word']) > 0:
                            if len(be[0]['unmatched_words']) > 0:
                                output_match_type = 'Words: Word, Unmatched'
                            else:
                                output_match_type = 'Words: all Word'
                        else:
                            output_match_type = 'Words: all Unmatched'

                        # store all unique words from each word-matching column
                        for key in unique_column_words.keys():
                            if be[0][key] != []:
                                for word in be[0][key]:
                                    if word not in unique_column_words[key]:
                                        unique_column_words[key].append(word)

                        out = [be[0]['attribute_name'], be[0]['transformed_name'], id, be[0]['attribute_path'], '', '', '', '', '', '', output_match_type,
                               ',  '.join(be[0]['matched_to_term']), ',  '.join(be[0]['term_or_lo']), ', '.join(be[0]['matched_term_URL']), ',  '.join(be[0]['matched_to_word']),
                               ', '.join(be[0]['matched_word_example_URL']), ',  '.join(be[0]['unmatched_words'])]
                    else:
                        # this code should never run if working properly.  Can search 'debug134' in output file to make sure it hasn't run
                        out = [be[0]['attribute_name'], '', id, be[0]['attribute_path'], '', '', 'debug134', '', '', '', '', '', '', '', '', '', '']
                writer.writerow(out)

        list_set = set(content_uuids)
        # convert the set to the list
        unique_cnt = len(list(list_set))
        self.stdout.write('*******There are {} unique BEDES terms to add*******'.format(unique_cnt))  # not sure if this code is relevent or accurate anymore

        # output file with list of unique words from each word-matching column - useful data to find candidates for manual mapping
        with open("%s/bsync_unique_words.csv" % (the_path), 'w', newline='') as file:
            writer = csv.writer(file, delimiter=',')

            # write out row of column headers
            writer.writerow(
                ['Unique Words Matched to Term', 'Unique Words Matched to Words', 'Unique Unmatched Words'])

            mt_length = len(unique_column_words['matched_to_term'])
            mw_length = len(unique_column_words['matched_to_word'])
            uw_length = len(unique_column_words['unmatched_words'])
            rows = max(mt_length, mw_length, uw_length)
            for i in range(rows):
                val1 = ''
                val2 = ''
                val3 = ''
                if i + 1 <= mt_length:
                    val1 = unique_column_words['matched_to_term'][i]
                if i + 1 <= mw_length:
                    val2 = unique_column_words['matched_to_word'][i]
                if i + 1 <= uw_length:
                    val3 = unique_column_words['unmatched_words'][i]
                writer.writerow([val1, val2, val3])

        results = {}
        for enumeration in Enumeration.objects.filter(schema=schema):
            results[enumeration.id] = []
            for be in bedes.enumerations:
                distance = jellyfish.jaro_winkler(enumeration.name, be['List-Option'])

                if distance >= 0.95:
                    results[enumeration.id].append({
                        "enumeration_name": enumeration.name,
                        "bedes_term": be['List-Option'],
                        "bedes_object": be,
                        "distance": distance
                    })
            results[enumeration.id] = sorted(results[enumeration.id], key=lambda k: -k['distance'])
            if not results[enumeration.id]:
                # didn't find anything
                results[enumeration.id].append({
                    "enumeration_name": enumeration.name
                })

        # store the results to CSV
        content_uuids = []
        with open("%s/bedes-mappings-enumerations.csv" % (the_path), 'w', encoding='utf-8', newline='') as file:
            writer = csv.writer(file, delimiter=',')
            # headers: enumeration name, enumeration id,
            # bedes Content-UUID, bedes term, bedes definition, bedes URL, bedes Related Term UUID, distance
            writer.writerow(
                ['enum_name', 'enum_id', 'bedes_content_uuid', 'bedes_term', 'bedes_definition',
                 'bedes_url', 'bedes_related_term_uuid', 'distance'])
            for enum, be in results.items():
                if len(be) > 0 and 'bedes_object' in be[0]:
                    content_uuids.append(be[0]['bedes_object']['Content-UUID'])
                    out = [be[0]['enumeration_name'], enum, be[0]['bedes_object']['Content-UUID'],
                           be[0]['bedes_term'], be[0]['bedes_object']['List-Option-Definition'],
                           be[0]['bedes_object']['URL'], be[0]['bedes_object']['Related-Term-UUID'],
                           be[0]['distance']]

                else:
                    out = [be[0]['enumeration_name'], enum, '', '', '', '', '', '']
                writer.writerow(out)

        list_set = set(content_uuids)
        # convert the set to the list
        unique_cnt = len(list(list_set))
        self.stdout.write(
            '*******There are {} unique BEDES enum values to add*******'.format(unique_cnt))

        # self.stdout.write(results)

        self.stdout.write('Finished parsing bedes')

    # function to take in a single BSync word (parsed from a term that didn't match), and run it through either
    # all BEDES terms or list options looking for exact matches, or word-for-word matches and return relevant data
    def word_matching(self, bsync_word, term_dict):

        bsync_word = bsync_word.lower()  # converting to all same case to neutralize case differences in matching
        # (will do to BEDES words we check against also)

        # check term_dict data to see if we're searching through BEDES terms or list-options
        # term_key is set to the String key that corresponds to the correct data we're
        # looking for in the term_dict (different between terms and list-options)
        if 'List-Option' in term_dict[0].keys():
            term_key = 'List-Option'
        else:
            term_key = 'Term'

        # initialize return strings with default values
        # match_status has 3 options: 'Unmatched', 'Matched-Term', or 'Matched-Word' depending on type of match accomplished
        match_status = 'Unmatched'
        match_URL = ''

        for term in term_dict:

            # searching for exact Bsync word to full BEDES term(or list option) match.
            # also trying to match with plural version of BEDES term; program was missing many matches because
            # BSync terms and words are pluralized while BEDES terms/words aren't.
            if bsync_word == term[term_key].lower() or bsync_word == term[term_key].lower() + 's':
                match_URL = term['URL']
                match_status = 'Matched-Term'

        if match_status == 'Unmatched':
            # if a BSync word didn't match with an entire BEDES term, iterate through BEDES terms, split into words, and look for word-to-word matches
            for term in term_dict:

                bedes_words = []
                # split the term with appropriate method depending on its source
                # Bsync terms are pretty straight forward, BEDES terms/list options already have spaces separating
                # them and have lots of symbols that need to be accounted for
                if term_key == 'Term':
                    bedes_words = self.acronym_check(re.findall('[A-Z][^A-Z ]*', term[term_key]))
                else:
                    bedes_words = re.findall('[^:^(^)^,^ ][^,^ ^:^(^)]*', term[term_key])

                for bedes_word in bedes_words:

                    bedes_word = bedes_word.lower().replace('-', ' ')
                    if bsync_word == bedes_word or bsync_word == bedes_word + 's':
                        match_URL = term['URL']
                        match_status = 'Matched-Word'

                if match_status != 'Unmatched':
                    break  # breaking out on first word match, just to return example data, and prove word is somewhere in BEDES

        return match_status, match_URL

    # function to search through a Building Sync term for words/word groups that are in the Manual Mappings table and replacing them
    # returns a string with replace words/word groups in correct order and with spaces in between all words
    def manual_mapping(self, bsync_term, manual_mappings):
        bsync_words = []
        # split BSync term into a list of individual words
        bsync_words = self.acronym_check(re.findall('[a-zA-Z][^A-Z ]*', bsync_term))
        if len(bsync_words) == 1:
            if bsync_term in manual_mappings.keys():
                bsync_term = manual_mappings[bsync_term]
            # checking for plural bsync terms that are in the manual mapping table as singular
            elif bsync_term[-1] == 's' and (bsync_term[:-1] in manual_mappings.keys()):
                bsync_term = manual_mappings[bsync_term[:-1]]
            return(bsync_term)

        # go through entire list, converting to an array that assigns an availability flag to each individual word
        for i in range(len(bsync_words)):
            bsync_words[i] = [bsync_words[i], True]

        restart_process = True
        reconstruction_dict = {}
        while restart_process:
            restart_process = False

            # generate word groups, starting with largest groups first
            for number_of_words in range(len(bsync_words), 0, -1):
                word_groups = {}

                # search through bsync_words for all possible combinations of word groups of proper length
                # made up of concurrent words with availability flags set to True, save in dict word_groups
                for starting_index in range(len(bsync_words) - number_of_words + 1):
                    word_construction = ''
                    word_construction_success = True
                    for i in range(starting_index, starting_index + number_of_words):
                        if bsync_words[i][1]:
                            word_construction += bsync_words[i][0] + ' '
                        else:
                            word_construction_success = False
                            break
                    if word_construction_success:
                        word_groups[word_construction.strip(' ')] = starting_index

                # Try to find each word group in manual mapping table
                for word_group in word_groups:

                    if word_group in manual_mappings.keys() or (word_group[-1] == 's' and (word_group[:-1] in manual_mappings.keys())):
                        if word_group in manual_mappings.keys():
                            replacement_word = manual_mappings[word_group]
                        else:
                            replacement_word = manual_mappings[word_group[:-1]]

                        # set availability flags to false for component words
                        for i in range(word_groups[word_group], word_groups[word_group] + number_of_words):
                            bsync_words[i][1] = False

                        # create pair in reconstruction_dict of (bsync_words index: word_group that found a match)
                        reconstruction_dict[word_groups[word_group]] = replacement_word

                        # start process to break out of loops, restart entire word grouping process (with updated word availability)
                        restart_process = True
                        break
                    elif number_of_words == 1:
                        # if no match was found, but we're down to individual word checking, store word in reconstruction_dict
                        reconstruction_dict[word_groups[word_group]] = word_group

                if restart_process:
                    break

        # rejoin BSync term with replaced words
        bsync_term = ''
        for i in sorted(reconstruction_dict):
            bsync_term += reconstruction_dict[i] + ' '
        bsync_term = bsync_term.strip(' ')

        return(bsync_term)

    # function to take in a word list that has been separated at Uppercase letters, and rejoin any acronyms that
    # have been separated
    def acronym_check(self, word_list):

        acronym_list = []
        acronym = ''

        word_list.append('buffer')    # arbitrary string added to end of list to help check run properly.  Deleted after check has run
        for i in range(len(word_list)):
            if len(word_list[i]) == 1:
                acronym = acronym + word_list[i]
            else:
                # check for 'words' that are 2 characters long ending in a lowercase s
                # looking for ends of pluralized acronyms (like 'IDs')
                if len(word_list[i]) == 2 and word_list[i][1] == 's':
                    word_list[i] = word_list[i][0]
                    acronym = acronym + word_list[i]
                else:
                    if acronym != '':
                        acronym_list.append(acronym)
                        acronym = ''
                    acronym_list.append(word_list[i])
        word_list = acronym_list
        del word_list[-1]

        return word_list

    def save_mappings_to_database(self, bedes_version, schema_version):
        """
        Save bedes terms from CSV files to database
        Only save bedes-buildingsync mappings when distance is > 95%

        :param bedes_version: string, version of bedes to import
        :param schema_version: string, version of buildingsync to import
        """

        # find the CSVs
        the_path = os.path.join(os.path.dirname(__file__), '../../lib/bedes', bedes_version,
                                "schema" + schema_version)
        if not os.path.isfile("%s/bedes-mappings-terms.csv" % (the_path)):
            raise FileNotFoundError(
                "Cannot find the bedes-mappings-terms.csv file in lib/bedes/{}/schema{} directory".format(
                    bedes_version, schema_version))

        the_path = os.path.join(os.path.dirname(__file__), '../../lib/bedes', bedes_version,
                                "schema" + schema_version)
        if not os.path.isfile("%s/bedes-mappings-enumerations.csv" % (the_path)):
            raise FileNotFoundError(
                "Cannot find the bedes-mappings-enumerations.csv file in lib/bedes/{}/schema{} directory".format(
                    bedes_version,
                    schema_version))

        # get schema
        schema = Schema.objects.filter(version=schema_version).first()

        # don't delete..reuse
        # BedesTerm.objects.all().delete()
        # BedesMapping.objects.all().delete()
        # BedesEnumeration.objects.all().delete()
        # BedesEnumerationMapping.objects.all().delete()

        # save all terms
        csv_file = open("%s/bedes-mappings-terms.csv" % (the_path), mode='r')
        bedes_mappings = csv.DictReader(csv_file)

        # will also need XML term file to get the definitions or the additional terms
        xml_dict = None
        with open(os.path.join(os.path.dirname(__file__), '../../lib/bedes', bedes_version, 'bedes_online_dictionary_uuid-terms.xml')) as file:
            xml_dict = xmltodict.parse(file.read())

        for term in bedes_mappings:
            # get_or_create here b/c CSV structure maps schema attributes to bedes terms
            # there could be multiple listings of the same bedes term
            if term['distance'] != "":
                BedesTerm.objects.get_or_create(
                    content_uuid=term['bedes_content_uuid'],
                    term=term['bedes_term'],
                    category=term['bedes_category'],
                    definition=term['bedes_definition'],
                    url=term['bedes_url']
                )
            # if mapping Words, find and save all word mappings
            if term['matched_term_URL'] != "":
                items = term['matched_term_URL'].split(',')
                for item in items:
                    # find in xml dict
                    item = item.strip(' ')

                    match = next((i for i in xml_dict['nodes']['node'] if i["URL"] == item), False)

                    if match:
                        # save term
                        definition = None
                        if match['Definition'].get('p'):
                            definition = match['Definition']['p']
                        else:
                            definition = match['Definition']
                        BedesTerm.objects.get_or_create(
                            content_uuid=match['Content-UUID'],
                            term=match['Term'],
                            category=match['Category'],
                            definition=definition,
                            url=item
                        )

            # same with matched word
            if term['matched_word_example_URL'] != "":
                items = term['matched_term_URL'].split(',')
                for item in items:
                    # find in xml dict
                    item = item.strip(' ')
                    match = next((i for i in xml_dict['nodes']['node'] if i["URL"] == item), False)
                    if match:
                        # save term
                        definition = None
                        if match['Definition'].get('p'):
                            definition = match['Definition']['p']
                        else:
                            definition = match['Definition']
                        BedesTerm.objects.get_or_create(
                            content_uuid=match['Content-UUID'],
                            term=match['Term'],
                            category=match['Category'],
                            definition=definition,
                            url=item
                        )

        # rewind
        csv_file.seek(0)
        next(bedes_mappings)
        for term in bedes_mappings:
            # mappings CSV contains match_type.  all Unmatched is the only one to ignore
            if term['match_type'] != "all Unmatched":
                # found a match
                attributes = Attribute.objects.filter(id=term['attribute_id'], schema=schema)
                terms = []
                if term['bedes_content_uuid'] != "":
                    terms = BedesTerm.objects.filter(content_uuid=term['bedes_content_uuid'])
                elif term['matched_term_URL'] != "":
                    # split list and get UUIDs
                    tlist = term['matched_term_URL'].split(',')
                    tlist = [i.strip(' ').replace('https://bedes.lbl.gov/node/', '') for i in tlist]

                    if term['matched_word_example_URL'] != "":
                        # add these too
                        tlist2 = term['matched_word_example_URL'].split(',')
                        tlist2 = [i.strip(' ').replace('https://bedes.lbl.gov/node/', '') for i in tlist2]
                        tlist = tlist + tlist2

                    terms = BedesTerm.objects.filter(content_uuid__in=tlist)

                elif term['matched_word_example_URL'] != "":
                    # split list and get UUIDs    
                    tlist = term['matched_word_example_URL'].split(',')
                    tlist = [i.strip(' ').replace('https://bedes.lbl.gov/node/', '') for i in tlist]
                    terms = BedesTerm.objects.filter(content_uuid__in=tlist)

                if len(terms) > 0 and len(attributes) > 0:
                    attr = attributes[0]
                    # first delete all old mappings for this attribute
                    BedesMapping.objects.filter(attribute=attr).delete()
                    # then add new mappings
                    for i in terms:
                        bedes_term = i
                        bmap = BedesMapping(
                            bedesTerm=bedes_term,
                            attribute=attr,
                            match_type=term['match_type']
                        )
                        bmap.save()

        # save all enumerations
        csv_file = open("%s/bedes-mappings-enumerations.csv" % (the_path), mode='r', encoding='utf-8')
        bedes_mappings = csv.DictReader(csv_file)
        bedes_mappings.fieldnames
        for term in bedes_mappings:
            # get_or_create here b/c CSV structure maps schema attributes to bedes terms
            # there could be multiple listings of the same bedes term.
            if term['distance'] != "":
                BedesEnumeration.objects.get_or_create(
                    content_uuid=term['bedes_content_uuid'],
                    term=term['bedes_term'],
                    definition=term['bedes_definition'],
                    url=term['bedes_url'],
                    related_term_uuid=term['bedes_related_term_uuid']
                )

        # rewind
        csv_file.seek(0)
        next(bedes_mappings)
        for term in bedes_mappings:
            # mappings CSV only contains distances >= 0.95 or it's blank
            if term['distance'] != "":
                # found a match
                enums = Enumeration.objects.filter(id=term['enum_id'], schema=schema)
                terms = BedesEnumeration.objects.filter(content_uuid=term['bedes_content_uuid'])

                if terms.count() > 0 and enums.count() > 0:
                    enum = enums[0]
                    bedes_term = terms[0]
                    BedesEnumerationMapping.objects.get_or_create(
                        bedesEnumeration=bedes_term,
                        enumeration=enum
                    )
