import json
import os
import re
from collections import defaultdict, OrderedDict, Mapping

import xmltodict


# BEDES have a very simple two level hierarchy. The first level is the category and the
# second category is the Term. The data are stored in this format, but it is important
# to note that the Term is globally unique.


class BedesParser(object):
    """
    Download XML of terms and list options from here: https://bedes.lbl.gov/bedes-online
    """

    def __init__(self, version, terms_filename='bedes_online_dictionary_uuid-terms.xml',
                 list_options_filename='bedes_online_dictionary_uuid-lo.xml'):
        """
        Data are loaded from the version directory. The default file names of the terms and list
        option files can be overriden, but the path is hardcodes.

        :param version: str, version of BEDES
        :param terms_filename:
        :param list_options_filename:
        """
        self.version = version
        self.enumerations = []
        self.terms = []

        reldir = os.path.dirname(__file__)
        if not os.path.exists(os.path.join(reldir, self.version)):
            raise Exception("Version of BEDES does not exist in %s directory" % version)

        if not os.path.exists(os.path.join(reldir, self.version, terms_filename)):
            raise Exception("BEDES terms file does not exist in %s directory" % version)

        if not os.path.exists(os.path.join(reldir, self.version, list_options_filename)):
            raise Exception("BEDES terms file does not exist in %s directory" % version)

        self.data = defaultdict(OrderedDict)
        self.parse(
            os.path.join(reldir, self.version, terms_filename),
            os.path.join(reldir, self.version, list_options_filename)
        )
        self._cache_terms()
        self._cache_enumerations()

    def term_exists(self, term):
        if term in self.terms:
            return True
        else:
            return False

    def parse(self, terms_filename, list_options_filename):
        list_options = defaultdict(OrderedDict)
        with open(list_options_filename, encoding='utf-8') as file:
            tmp = xmltodict.parse(file.read())
            # create a look up from this data to easily associate the data
            for lo in tmp['nodes']['node']:
                if not list_options.get(lo['Related-Term'], None):
                    list_options[lo['Related-Term']] = []
                list_options[lo['Related-Term']].append(lo)

        terms = None
        with open(terms_filename) as file:
            terms = xmltodict.parse(file.read())

        # merge the terms and list options
        for term in terms['nodes']['node']:
            # check if the term is already in the dataset
            if self.term_exists(term['Term']):
                print('Term already exists for %s' % term['Term'])

            if not self.data.get(term['Category'], None):
                self.data[term['Category']] = []

            self.data[term['Category']].append(term)

            self.data[term['Category']][-1]['list_options'] = []
            # check if there is a list option
            if list_options.get(term['Term'], None):
                self.data[term['Category']][-1]['list_options'] = list_options[term['Term']]

    def save(self):
        path = os.path.join(os.path.dirname(__file__), self.version)
        with open("%s/bedes_%s.json" % (path, self.version), 'w') as new_file:
            new_file.write(json.dumps(self.data, indent=2))

    @property
    def categories(self):
        return self.data.keys()

    def _cache_terms(self):
        """
        Get all the terms independent of the categories
        """
        self.terms = []
        for cat, terms in self.data.items():
            for t in terms:
                # collect only specific fields from the terms
                assembled = {}
                for t_name in ['Term', 'Category', 'Content-UUID', 'URL']:
                    assembled[t_name] = t[t_name]

                # print(t)
                assembled['Term-Definition'] = None
                if t['Definition']:
                    if t['Definition'].get('p'):
                        # remove html tags if they happen to be in the definition (ex: email address)
                        the_def = t['Definition']['p']
                        # check for ordered dict (when html elements are found in the definition)
                        if isinstance(the_def, Mapping):
                            # print("EDGE CASE: definition is a dict: {}".format(the_def))
                            if 'a' in the_def.keys():
                                # edge case: <a>.  grab text element
                                assembled['Term-Definition'] = the_def['#text'] + ' ' + the_def['a']['#text']
                                # print("DEF: {}".format(the_def['#text'] + ' ' + the_def['a']['#text']))
                            elif 'span' in the_def.keys():
                                # edge case: <span>. grab span.text element
                                assembled['Term-Definition'] = the_def['span']['#text']
                                # print("DEF: {}".format(the_def['span']['#text']))
                        else:
                            assembled['Term-Definition'] = the_def
                self.terms.append(assembled)

    def _cache_enumerations(self):
        self.enumerations = []
        for cat, terms in self.data.items():
            for term in terms:
                if term.get('list_options', None):
                    for lo in term['list_options']:
                        # collect only specific fields from the terms
                        assembled = {}
                        for t_name in ['List-Option', 'Content-UUID', 'URL', 'List-Option-Definition', 'Related-Term-UUID']:
                            assembled[t_name] = lo[t_name]
                        self.enumerations.append(assembled)


if __name__ == '__main__':
    bedes = BedesParser('v2.2')
    bedes.save()

    # print(bedes.terms)
    # print(bedes.categories)
    # print(bedes.enumerations)
