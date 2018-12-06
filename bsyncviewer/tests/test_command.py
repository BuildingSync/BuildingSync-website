import os
from random import randint
from shutil import copyfile
from io import StringIO
from django.core.management import call_command
from django.test import TestCase
from bsyncviewer.models.schema import Schema
from bsyncviewer.models.bedes_models import BedesTerm, BedesEnumeration
from bsyncviewer.models.use_case import UseCase
from bsyncviewer.models.use_case_attribute import UseCaseAttribute

from django.conf import settings
DEFAULT_SCHEMA_VERSION = settings.DEFAULT_SCHEMA_VERSION


class TestCommand(TestCase):

    def test_reset_schema_command(self):
        print('TESTING RESET SCHEMA COMMAND')
        out = StringIO()
        call_command('reset_schema', schema_version=DEFAULT_SCHEMA_VERSION, stdout=out)

        # was a schema created?
        schemas = Schema.objects.all()
        self.assertGreater(schemas.count(), 0)

        # clean-up
        for schema in schemas:
            schema.delete()

    def test_create_use_case_command(self):
        print('TESTING CREATE USE CASE COMMAND')

        # first add a schema
        sf = os.path.join(os.path.dirname(__file__), 'data', 'test_schema.xsd')
        schema_file = os.path.join(
            os.path.dirname(__file__), 'data', 'schema_file_%s.xsd' % randint(0, 10000)
        )
        copyfile(sf, schema_file)

        self.schema = Schema(
            name='Version {}'.format(DEFAULT_SCHEMA_VERSION),
            version=DEFAULT_SCHEMA_VERSION,
            schema_file=schema_file
        )
        self.schema.save()  # Calling save also processes the schema and generates the template

        out = StringIO()
        call_command('create_use_case', stdout=out)

        # assert that a use case was created
        useCases = UseCase.objects.all().count()
        useCaseAttrs = UseCaseAttribute.objects.all().count()
        print("USE CASES: {}, USE CASE ATTRIBUTES: {}".format(useCases, useCaseAttrs))
        self.assertGreater(useCases, 0)
        self.assertGreater(useCaseAttrs, 0)

        # clean-up
        self.schema.delete()

    def test_bedes_command(self):
        print('TESTING BEDES COMMAND')

        # first add a schema
        sf = os.path.join(os.path.dirname(__file__), 'data', 'test_schema.xsd')
        schema_file = os.path.join(
            os.path.dirname(__file__), 'data', 'schema_file_%s.xsd' % randint(0, 10000)
        )
        copyfile(sf, schema_file)

        self.schema = Schema(
            name='Version {}'.format(DEFAULT_SCHEMA_VERSION),
            version=DEFAULT_SCHEMA_VERSION,
            schema_file=schema_file
        )
        self.schema.save()  # Calling save also processes the schema and generates the template

        # create the CSV files
        out = StringIO()
        call_command('bedes', schema_version=DEFAULT_SCHEMA_VERSION, bedes_version='v2.2', stdout=out)

        # add to database
        call_command('bedes', schema_version=DEFAULT_SCHEMA_VERSION, bedes_version='v2.2', save_to_db=True, stdout=out)

        # check that there are items in bedes models
        bterms = BedesTerm.objects.all().count()
        benums = BedesEnumeration.objects.all().count()
        print("BEDES TERMS: {}, BEDES ENUMS: {}".format(bterms, benums))
        self.assertGreater(bterms, 0)
        self.assertGreater(benums, 0)

        # clean-up
        self.schema.delete()
