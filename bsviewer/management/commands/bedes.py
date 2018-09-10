import jellyfish
from django.core.management.base import BaseCommand

from bsviewer.lib.bedes.bedes_parser import BedesParser
from bsviewer.models.schema import Schema
from bsviewer.models.enumeration import Enumeration
import csv

class Command(BaseCommand):
    help = 'Closes the specified poll for voting'

    def add_arguments(self, parser):
        parser.add_argument('--schema_version', type=float, default=0.3)

    def handle(self, *args, **options):
        bedes = BedesParser('v1.2')
        bedes.save()

        # print(bedes.terms)
        # print(bedes.categories)

        # read the fields from the database, right now default to shema 0.3
        print("reading schema attributes")
        schema = Schema.objects.filter(version=options['schema_version']).first()
        results = {}
        for attribute in schema.attributes.all().order_by('index'):
            # print(attribute.na)
            # calculate string distance for every item in bedes
            results[attribute.name] = []
            for bt in bedes.terms:
                distance = jellyfish.jaro_winkler(attribute.name, bt['Term'])
                if distance > 0.9:
                    results[attribute.name].append({
                        "bedes_term": bt['Term'],
                        "bedes_object": bt,
                        "distance": distance
                    })
            results[attribute.name] = sorted(results[attribute.name], key=lambda k: -k['distance'])

        print(results)
        # store the results to CSV
        with open('bedes-mappings-terms.csv', 'w') as file:
            writer = csv.writer(file, delimiter=',')
            for enum, be in results.items():
                if len(be) > 0:
                    out = [enum, be[0]['bedes_term'], be[0]['distance']]
                else:
                    out = [enum, '', '']
                writer.writerow(out)

        results = {}
        for enumeration in Enumeration.objects.filter(schema=schema):
            results[enumeration.name] = []
            for be in bedes.enumerations:
                distance = jellyfish.jaro_winkler(enumeration.name, be)
                if distance > 0.9:
                    results[enumeration.name].append({
                        "bedes_term": be,
                        "distance": distance
                    })
            results[enumeration.name] = sorted(results[enumeration.name], key=lambda k: -k['distance'])


        # store the results to CSV
        with open('bedes-mappings-enumerations.csv', 'w') as file:
            writer = csv.writer(file, delimiter=',')
            for enum, be in results.items():
                if len(be) > 0:
                    out = [enum, be[0]['bedes_term'], be[0]['distance']]
                else:
                    out = [enum, '', '']
                writer.writerow(out)

        print(results)

        self.stdout.write('Finished parsing bedes')
