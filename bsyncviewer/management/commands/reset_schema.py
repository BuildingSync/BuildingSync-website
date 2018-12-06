import os
from random import randint
from shutil import copyfile

from django.core.management.base import BaseCommand

from bsyncviewer.models.schema import Schema


class Command(BaseCommand):
    help = 'Closes the specified poll for voting'

    def add_arguments(self, parser):
        parser.add_argument('--schema_version', type=float)

    def handle(self, *args, **options):
        # Load the BuildingSync file.
        schema = Schema.objects.filter(version=options['schema_version']).first()
        if schema:
            schema.delete()

        # schema file - make sure to create a copy since the version will be deleted if
        # the schema is deleted
        sf = 'bsyncviewer/lib/buildingsync_schemas/BuildingSync_v%s.xsd' % options['schema_version']
        schema_file = 'schema_file_%s' % randint(0, 10000)
        copyfile(sf, schema_file)
        schema = Schema(
            name='Version %s' % options['schema_version'],
            version=options['schema_version'],
            schema_file=schema_file
        )
        schema.save()  # Calling save also processes the schema

        for attribute in schema.attributes.all().order_by('id'):
            print(attribute)
            # if attribute.enumeration_classes.first():
            #     for enum in attribute.enumeration_classes.first().enumerations.all().order_by('index'):
            #         print("****************** enumeration: %s" % enum)

        self.stdout.write('Imported %s fields and %s enumerations' %
                          (schema.attributes.count(), schema.enumerations.count()))

        # save off the template for now
        schema.save_template(filename=os.path.join(os.path.dirname(__file__), 'template_0.3'))
        self.stdout.write('Finished parsing and saving schema')
