import os
from io import StringIO

from bsyncviewer.models.bedes_models import BedesEnumeration, BedesTerm
from bsyncviewer.models.schema import Schema
from bsyncviewer.models.use_case import UseCase
from django.conf import settings
from django.core.files.uploadedfile import SimpleUploadedFile
from django.core.management import call_command
from django.test import TestCase

# For reset test only
DEFAULT_SCHEMA_VERSION = settings.DEFAULT_SCHEMA_VERSION

# Use a custom version that is not an actual version to prevent overwriting saved BEDES mappings
TEST_SCHEMA_VERSION = '0.0.1'


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


class TestCommandWithSchema(TestCase):

    def setUp(self):
        self.schema = Schema.objects.filter(version=TEST_SCHEMA_VERSION).first()
        if not self.schema:
            # add schema file - make sure to create a copy since the version will be deleted if
            # the schema is deleted
            sf = os.path.join(os.path.dirname(__file__), 'data', 'test_schema.xsd')
            file = open(sf, 'rb')
            simple_uploaded_file = SimpleUploadedFile(file.name, file.read())

            self.schema = Schema(
                name='Version {}'.format(TEST_SCHEMA_VERSION),
                version=TEST_SCHEMA_VERSION,
                schema_file=simple_uploaded_file
            )
            self.schema.save()  # Calling save also processes the schema and generates the template

    def test_create_use_case_command(self):
        print('TESTING CREATE USE CASE COMMAND')

        out = StringIO()
        call_command('create_use_case', schema_version=TEST_SCHEMA_VERSION, stdout=out)

        # assert that a use case was created
        use_cases = UseCase.objects.all().count()
        print("USE CASES: {}".format(use_cases))
        self.assertGreater(use_cases, 0)

    def test_bedes_command(self):
        # The schema must exist before this command is called.
        print('TESTING BEDES COMMAND')

        # create the CSV files
        out = StringIO()
        call_command('bedes', schema_version=TEST_SCHEMA_VERSION, bedes_version='v2.2', stdout=out)

        # add to database
        call_command('bedes', schema_version=TEST_SCHEMA_VERSION, bedes_version='v2.2', save_to_db=True, stdout=out)

        # check that there are items in bedes models
        bterms = BedesTerm.objects.all().count()
        benums = BedesEnumeration.objects.all().count()
        print("BEDES TERMS: {}, BEDES ENUMS: {}".format(bterms, benums))
        self.assertGreater(bterms, 0)
        self.assertGreater(benums, 0)

    def tearDown(self):
        # clean-up files on disk
        if self.schema and self.schema.id is not None:
            self.schema.delete()
