import os
from shutil import copyfile

from django.conf import settings
from django.core.management.base import BaseCommand

from bsviewer.models.schema import Schema


class Command(BaseCommand):
    help = 'manage schemas'

    def add_arguments(self, parser):
        parser.add_argument('--schema_version', type=str, default=settings.DEFAULT_SCHEMA_VERSION)
        parser.add_argument('--overwrite', default=False, action='store_true')

    def handle(self, *args, **options):
        """
        Load the BuildingSync file.

        :param args:
        :param options:
        :return:
        """
        self.stdout.write('Importing schema %s' % options['schema_version'])
        if not options['overwrite']:
            if Schema.objects.filter(version=options['schema_version']).exists():
                self.stdout.write(
                    'Schema already exists in the database: %s' % options['schema_version'])
                exit(0)

        schema = Schema.objects.filter(version=options['schema_version']).first()
        if schema:
            schema.delete()

        # schema file - make sure to create a copy since the version will be deleted if
        # the schema is deleted
        sf = 'bsviewer/lib/buildingsync_schemas/BuildingSync_v%s.xsd' % options['schema_version']
        schema_file = 'bsviewer/media/uploaded_schemas/BuildingSync_v%s.xsd' % options[
            'schema_version']
        if os.path.exists(schema_file):
            os.remove(schema_file)
        if not os.path.exists(os.path.dirname(schema_file)):
            os.makedirs(os.path.dirname(schema_file))
        copyfile(sf, schema_file)
        schema = Schema(
            name='Version %s' % options['schema_version'],
            version=options['schema_version'],
            schema_file='uploaded_schemas/BuildingSync_v%s.xsd' % options['schema_version']
        )
        schema.save()  # Calling save also processes the schema

        # Print out some of the data for validation purposes
        for attribute in schema.attributes.all().order_by('index'):
            self.stdout.write(str(attribute))
            # if attribute.enumeration_classes.first():
            #     for enum in attribute.enumeration_classes.first().enumerations.all().order_by('index'):
            #         print("****************** enumeration: %s" % enum)

        self.stdout.write('Imported %s fields and %s enumerations' %
                          (schema.attributes.count(), schema.enumerations.count()))
