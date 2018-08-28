import json
import os
from collections import defaultdict, OrderedDict

import xmltodict


# BEDES have a very simple two level hierarchy. The first level is the category and the
# second category is the Term. The data are stored in this format, but it is important
# to note that the Term is globally unique.


class BedesParser(object):
    '''
    Download XML of terms and list options from here: https://bedes.lbl.gov/bedes-online
    '''

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

    def term_exists(self, term):
        if term in self.terms:
            return True
        else:
            return False

    def parse(self, terms_filename, list_options_filename):
        print(terms_filename)
        print(list_options_filename)
        list_options = defaultdict(OrderedDict)
        with open(list_options_filename) as file:
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
        # with open("bedes_list_options_%s.json" % self.version, 'w') as new_file:
        # new_file.write(json.dumps(list_options, indent=2))
        with open("bedes_%s.json" % self.version, 'w') as new_file:
            new_file.write(json.dumps(self.data, indent=2))

    @property
    def terms(self):
        # get all the terms independent of the categories
        term_names = []
        for cat, terms in self.data.items():
            for t in terms:
                term_names.append(t['Term'])

        return term_names

    @property
    def categories(self):
        return self.data.keys()


if __name__ == '__main__':
    bedes = BedesParser('v1.2')
    bedes.save()

    print(bedes.terms)
    print(bedes.categories)
