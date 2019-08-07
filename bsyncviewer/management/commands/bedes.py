import csv
import os
import re

import jellyfish
from django.conf import settings
from django.core.management.base import BaseCommand

from bsyncviewer.lib.bedes.bedes_parser import BedesParser
from bsyncviewer.models.attribute import Attribute
from bsyncviewer.models.bedes_models import BedesTerm, BedesMapping, BedesEnumeration, \
    BedesEnumerationMapping
from bsyncviewer.models.enumeration import Enumeration
from bsyncviewer.models.schema import Schema


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

        # read the fields from the database, right now default to schema 0.3
        schema = Schema.objects.filter(version=schema_version).first()
        results = {}
        for attribute in schema.attributes.all().order_by('id'):
            # self.stdout.write(attribute.na)
            # calculate string distance for every item in bedes
            # use id as the key since name is not unique
            results[attribute.id] = []
            for bt in bedes.terms:
                distance = jellyfish.jaro_winkler(attribute.name, bt['Term'])

                if distance >= 0.95:
                    results[attribute.id].append({
                        "attribute_name": attribute.name,
                        "attribute_path": attribute.path,
                        "bedes_term": bt['Term'],
                        "bedes_object": bt,
                        "distance": distance
                    })
                    
            results[attribute.id] = sorted(results[attribute.id], key=lambda k: -k['distance'])

            if not results[attribute.id]:
                # didn't find any term-to-term matches

                words_data = {}
                words_data['bedes_word'] = []
                words_data['bedes_word_URL'] = []
                words_data['is_bedes_term'] = []
                       
                bsync_words = []
                # split BSync term into a list of individual words
                bsync_words = self.acronym_check(re.findall('[A-Z][^A-Z ]*', attribute.name))
                current_word_number = 0
                
                for bsync_word in bsync_words:

                    words_data['bedes_word'].append('No Match')
                    words_data['bedes_word_URL'].append('No Match')
                    words_data['is_bedes_term'].append('False')

                    for bt in bedes.terms:
                        # right now we're looking at direct matches, so we don't really need jellyfish distance calculations,
                        # but code has been left in case we want to use it and try out distance thresholds (like .99 or something)
                        distance = jellyfish.jaro_winkler(bsync_word, bt['Term'])  

                        if distance == 1:
                            words_data['bedes_word'][current_word_number] = bt['Term']
                            words_data['bedes_word_URL'][current_word_number] = bt['URL']
                            words_data['is_bedes_term'][current_word_number] = 'True'
                        else:
                            # if match not found, try to match with plural version of BEDES term; program was missing matches because
                            # BSync terms and words are pluralized while BEDES terms/words aren't
                            distance = jellyfish.jaro_winkler(bsync_word, bt['Term'] + 's')
                            if distance == 1:
                                words_data['bedes_word'][current_word_number] = bt['Term']
                                words_data['bedes_word_URL'][current_word_number] = bt['URL']
                                words_data['is_bedes_term'][current_word_number] = 'True'
                            
                    if words_data['is_bedes_term'][current_word_number] == 'False':
                        # if a BSync word didn't match with an entire BEDES term, iterate through BEDES terms, split into words, and look for word-to-word matches
                        for bt in bedes.terms:
                            bedes_words = []
                            bedes_words = self.acronym_check(re.findall('[A-Z][^A-Z ]*', bt['Term']))
                            for bedes_word in bedes_words:
                                
                                distance = jellyfish.jaro_winkler(bsync_word, bedes_word)

                                if distance == 1:
                                    words_data['bedes_word'][current_word_number] = bedes_word
                                    words_data['bedes_word_URL'][current_word_number] = bt['URL']
                                else:
                                    distance = jellyfish.jaro_winkler(bsync_word, bedes_word + 's')
                                    if distance == 1:
                                        words_data['bedes_word'][current_word_number] = bedes_word
                                        words_data['bedes_word_URL'][current_word_number] = bt['URL']
                                    
                            if words_data['bedes_word'][current_word_number] != 'No Match':
                                break
                                                                         
                    current_word_number += 1

                results[attribute.id].append({
                    "attribute_name": attribute.name,
                    "attribute_path": attribute.path,
                    "bedes_word": words_data['bedes_word'],
                    "bedes_word_URL": words_data['bedes_word_URL'],
                    "is_bedes_term": words_data['is_bedes_term']
                    })
        # self.stdout.write(results)

        # store the results to CSV
        the_path = os.path.join(os.path.dirname(__file__), '../../lib/bedes', bedes_version,
                                "schema" + schema_version)

        print("THE PATH: {}".format(the_path))
        if not os.path.exists(the_path):
            os.makedirs(the_path)

        content_uuids = []
        with open("%s/bedes-mappings-terms.csv" % (the_path), 'w') as file:
            writer = csv.writer(file, delimiter=',')
            # headers: attribute name, attribute id, attribute path, Content-UUID, bedes term, bedes_category, bedes definition, bedes URL,  distance,
            # bedes_word, 'bedes_word_URL', 'is_bedes_term'
            writer.writerow(
                ['attribute_name', 'attribute_id', 'attribute_path', 'bedes_content_uuid',
                 'bedes_term', 'bedes_category', 'bedes_definition', 'bedes_url', 'distance', 'bedes_word', 'bedes_word_URL', 'is_bedes_term'])
            for id, be in results.items():
                if len(be) > 0 and 'bedes_object' in be[0]:
                    out = [be[0]['attribute_name'], id, be[0]['attribute_path'],
                           be[0]['bedes_object']['Content-UUID'], be[0]['bedes_term'],
                           be[0]['bedes_object']['Category'],
                           be[0]['bedes_object']['Term-Definition'], be[0]['bedes_object']['URL'],
                           be[0]['distance'], '', '', '']
                    content_uuids.append(be[0]['bedes_object']['Content-UUID'])
                else:
                    if 'bedes_word' in be[0]:
                        out = [be[0]['attribute_name'], id, be[0]['attribute_path'], '', '', '', '', '', '',
                               ', '.join(be[0]['bedes_word']), ', '.join(be[0]['bedes_word_URL']), ', '.join(be[0]['is_bedes_term'])] 
                    else:    
                        out = [be[0]['attribute_name'], id, be[0]['attribute_path'], '', '', '', '', '', '', '', '', '']
                writer.writerow(out)

        list_set = set(content_uuids)
        # convert the set to the list
        unique_cnt = len(list(list_set))
        self.stdout.write('*******There are {} unique BEDES terms to add*******'.format(unique_cnt))

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
        with open("%s/bedes-mappings-enumerations.csv" % (the_path), 'w', encoding ='utf-8') as file:
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

    def save_mappings_to_database(self, bedes_version, schema_version):
        """
        Save bedes terms from CSV files to database
        Only save bedes-buildingsync mappings when distance is > 90%

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

        # first delete all
        BedesTerm.objects.all().delete()
        BedesMapping.objects.all().delete()
        BedesEnumeration.objects.all().delete()
        BedesEnumerationMapping.objects.all().delete()

        # save all terms
        csv_file = open("%s/bedes-mappings-terms.csv" % (the_path), mode='r')
        bedes_mappings = csv.DictReader(csv_file)
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

        # rewind
        csv_file.seek(0)
        next(bedes_mappings)
        for term in bedes_mappings:
            # mappings CSV only contains distances >= 0.95 or it's blank
            if term['distance'] != "":
                # found a match
                attributes = Attribute.objects.filter(id=term['attribute_id'], schema=schema)
                terms = BedesTerm.objects.filter(content_uuid=term['bedes_content_uuid'])

                if terms.count() > 0 and attributes.count() > 0:
                    attr = attributes[0]
                    bedes_term = terms[0]
                    bmap = BedesMapping(
                        bedesTerm=bedes_term,
                        attribute=attr
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
                    bmap = BedesEnumerationMapping(
                        bedesEnumeration=bedes_term,
                        enumeration=enum
                    )
                    bmap.save()

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
