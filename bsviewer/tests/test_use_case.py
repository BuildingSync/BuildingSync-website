import os
from random import randint
from shutil import copyfile

from django.test import TestCase
from django.core.files import File

from bsviewer.models.use_case import UseCase
from bsviewer.models.schema import Schema

from django.conf import settings
DEFAULT_SCHEMA_VERSION = settings.DEFAULT_SCHEMA_VERSION


class TestUseCase(TestCase):
    def setUp(self):
        self.schema = Schema.objects.filter(version=DEFAULT_SCHEMA_VERSION).first()
        if not self.schema:
            # add schema file - make sure to create a copy since the version will be deleted if
            # the schema is deleted
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

        # create 1 use case without a use case file
        self.usecase = UseCase(
            name='Test Use Case',
            schema=self.schema
        )
        self.usecase.save()  # Calling save also processes the schema and generates the template

    def test_usecase_unparsed(self):
        # check that post_save didn't run: usecase_parsed should be False and import_file should be None
        self.assertFalse(self.usecase.usecase_parsed)
        attributes = self.usecase.usecaseattribute_set
        self.assertEqual(attributes.count(), 0)

    def add_usecase(self):
        # add file and save
        usf = os.path.join(os.path.dirname(__file__), 'data', 'test_use_case.csv')

        # save to model
        with open(usf, 'r') as f:
            file_contents = File(f)
            self.usecase.import_file.save(usf, file_contents, True)

    def delete_usecase(self):
        self.saved_file_path = self.usecase.import_file.path
        self.usecase.delete()

    def test_add_usecase_file_parsed_then_delete(self):
        self.add_usecase()
        # then check that parsed = True and there are attributes in UseCaseAttributes
        self.assertTrue(self.usecase.usecase_parsed)
        attributes = self.usecase.usecaseattribute_set
        self.assertGreater(attributes.count(), 0)

        print('usecase saved filename: {}'.format(self.usecase.import_file.path))

        self.delete_usecase()
        self.assertFalse(os.path.exists(self.saved_file_path))

    def tearDown(self):
        # clean-up files on disk
        if self.schema and self.schema.id is not None:
            self.schema.delete()
