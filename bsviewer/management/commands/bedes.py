import os
import jellyfish
from django.core.management.base import BaseCommand

from bsviewer.lib.bedes.bedes_parser import BedesParser
from bsviewer.models.schema import Schema
from bsviewer.models.enumeration import Enumeration
from bsviewer.models.attribute import Attribute
from bsviewer.models.bedes_models import BedesTerm, BedesMapping
import csv

from django.conf import settings
DEFAULT_SCHEMA_VERSION = settings.DEFAULT_SCHEMA_VERSION


class Command(BaseCommand):
    help = 'Closes the specified poll for voting'

    def add_arguments(self, parser):
        parser.add_argument('--schema_version', type=str, default=DEFAULT_SCHEMA_VERSION)
        parser.add_argument('--bedes_version', type=str, default='v1.2')
        parser.add_argument('--save_to_db', type=bool, default=False)

    def handle(self, *args, **options):

        # handle arguments
        bedes_version = options['bedes_version']
        schema_version = options['schema_version']
        save_to_db = options['save_to_db']

        if save_to_db:
            # if save_to_db is True, save CSV files to DB (don't reparse)
            self.save_mappings_to_database(bedes_version, schema_version)

        else:
            # do the parsing (only)
            self.parse(bedes_version, schema_version)

    def parse(self, bedes_version, schema_version):

        # parse correct bedes version
        bedes = BedesParser(bedes_version)
        bedes.save()

        # print(bedes.terms)
        # print(bedes.categories)

        # read the fields from the database, right now default to schema 0.3
        print("reading schema attributes")
        schema = Schema.objects.filter(version=schema_version).first()
        results = {}
        for attribute in schema.attributes.all().order_by('index'):
            # print(attribute.na)
            # calculate string distance for every item in bedes
            results[attribute.name] = []
            for bt in bedes.terms:
                distance = jellyfish.jaro_winkler(attribute.name, bt['Term'])

                if distance >= 0.9:
                    results[attribute.name].append({
                        "attribute_id": attribute.id,
                        "attribute_path": attribute.path,
                        "bedes_term": bt['Term'],
                        "bedes_object": bt,
                        "distance": distance
                    })
            results[attribute.name] = sorted(results[attribute.name], key=lambda k: -k['distance'])

        # print(results)

        # store the results to CSV
        the_path = os.path.join(os.path.dirname(__file__), '../../lib/bedes', bedes_version, "schema" + schema_version)
        if not os.path.exists(the_path):
            os.makedirs(the_path)

        with open("%s/bedes-mappings-terms.csv" % (the_path), 'w') as file:
            writer = csv.writer(file, delimiter=',')
            for name, be in results.items():
                if len(be) > 0:
                    # headers: attribute name, attribute id, attribute path, Content-UUID, bedes term, bedes category, bedes definition, bedes URL, distance
                    out = [name, be[0]['attribute_id'], be[0]['attribute_path'], be[0]['bedes_object']['Content-UUID'], be[0]['bedes_term'], be[0]['bedes_object']['Category'], be[0]['bedes_object']['Term-Definition'], be[0]['bedes_object']['URL'], be[0]['distance']]
                else:
                    out = [name, '', '', '', '', '', '', '', '']
                writer.writerow(out)

        results = {}
        for enumeration in Enumeration.objects.filter(schema=schema):
            results[enumeration.name] = []
            for be in bedes.enumerations:
                distance = jellyfish.jaro_winkler(enumeration.name, be)
                if distance >= 0.9:
                    results[enumeration.name].append({
                        "enumeration_id": enumeration.id,
                        "bedes_term": be,
                        "distance": distance
                    })

            results[enumeration.name] = sorted(results[enumeration.name], key=lambda k: -k['distance'])

        # store the results to CSV
        with open("%s/bedes-mappings-enumerations.csv" % (the_path), 'w') as file:
            writer = csv.writer(file, delimiter=',')
            for enum, be in results.items():
                if len(be) > 0:
                    # TODO: enumerations currently only have a name, return other info too
                    # headers: enumeration name, enumeration id, Content-UUID, bedes term, bedes category, bedes definition, bedes URL, distance
                    # out = [enum, be[0]['enumeration_id'], be[0]['bedes_object']['Content-UUID'], be[0]['bedes_term'], be[0]['bedes_object']['Category'], be[0]['bedes_object']['Term-Definition'], be[0]['bedes_object']['URL'], be[0]['distance']]
                    out = [enum, be[0]['enumeration_id'], be[0]['bedes_term'], be[0]['distance']]
                else:
                    #out = [enum, '', '', '', '', '', '', '']
                    out = [enum, '', '', '']
                writer.writerow(out)

        # print(results)

        self.stdout.write('Finished parsing bedes')

    def save_mappings_to_database(self, bedes_version, schema_version):
        # Save bedes terms from CSV files to database
        # Only save bedes-buildingsync mappings when distance is > 90%
        # TODO: enumerations

        # find the CSVs
        the_path = os.path.join(os.path.dirname(__file__), '../../lib/bedes', bedes_version, "schema" + schema_version)
        if not os.path.isfile("%s/bedes-mappings-terms.csv" % (the_path)):
            raise FileNotFoundError("Cannot find the bedes-mappings-terms.csv file in lib/bedes/{}/schema{} directory".format(bedes_version, schema_version))

        the_path = os.path.join(os.path.dirname(__file__), '../../lib/bedes', bedes_version, "schema" + schema_version)
        if not os.path.isfile("%s/bedes-mappings-enumerations.csv" % (the_path)):
            raise FileNotFoundError(
                "Cannot find the bedes-mappings-enumerations.csv file in lib/bedes/{}/schema{} directory".format(bedes_version,
                                                                                                                 schema_version))

        # get schema
        schema = Schema.objects.filter(version=schema_version).first()

        # first delete all
        BedesTerm.objects.all().delete()
        BedesMapping.objects.all().delete()

        csv_file = open("%s/bedes-mappings-terms.csv" % (the_path), mode='r')
        bedes_mappings = csv.DictReader(csv_file, fieldnames=['name', 'attribute_id', 'attribute_path', 'content_uuid', 'bedes_term', 'bedes_category', 'bedes_definition', 'bedes_url', 'distance'])

        # save all the terms
        for term in bedes_mappings:
            # headers: attribute name, attribute id, attribute path, Content-UUID, bedes term, bedes category, bedes definition, bedes URL, distance
            # get_or_create here b/c CSV structure maps schema attributes to bedes terms and there could be multiple listings of the same bedes term.
            if term['distance'] != "":
                b = BedesTerm.objects.get_or_create(
                    content_uuid=term['content_uuid'],
                    term=term['bedes_term'],
                    category=term['bedes_category'],
                    definition=term['bedes_definition'],
                    url=term['bedes_url']
                )

        # rewind
        csv_file.seek(0)
        for term in bedes_mappings:
            # mappings CSV only contains distances >= 0.90 or it's blank
            if term['distance'] != "":
                # found a match
                attributes = Attribute.objects.filter(id=term['attribute_id'], schema=schema)
                terms = BedesTerm.objects.filter(content_uuid=term['content_uuid'])

                if terms.count() > 0 and attributes.count() > 0:
                    attr = attributes[0]
                    bedes_term = terms[0]
                    bmap = BedesMapping(
                        bedesTerm=bedes_term,
                        attribute=attr
                    )
                    bmap.save()
