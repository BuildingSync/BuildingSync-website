import os

from django.conf import settings
from django.core.files.uploadedfile import SimpleUploadedFile
from django.test import TestCase

from bsyncviewer.models.schema import Schema
from bsyncviewer.models.use_case import UseCase

DEFAULT_SCHEMA_VERSION = settings.DEFAULT_SCHEMA_VERSION


class TestUseCase(TestCase):
    def setUp(self):
        self.schema = Schema.objects.filter(version=DEFAULT_SCHEMA_VERSION).first()
        if not self.schema:
            # add schema file - make sure to create a copy since the version will be deleted if
            # the schema is deleted
            sf = os.path.join(os.path.dirname(__file__), 'data', 'test_schema.xsd')
            file = open(sf, 'rb')
            simple_uploaded_file = SimpleUploadedFile(file.name, file.read())

            self.schema = Schema(
                name='Version {}'.format(DEFAULT_SCHEMA_VERSION),
                version=DEFAULT_SCHEMA_VERSION,
                schema_file=simple_uploaded_file
            )
            self.schema.save()  # Calling save also processes the schema and generates the template

        # create 1 use case without a use case file
        self.usecase = UseCase(
            name='Test Use Case',
            schema=self.schema
        )
        self.usecase.save()  # Calling save also processes the schema and generates the template

    def add_usecase(self):
        # add file and save
        usf = os.path.join(os.path.dirname(__file__), 'data', 'test_use_case.sch')
        file = open(usf, 'rb')
        simple_uploaded_file = SimpleUploadedFile(file.name, file.read())

        # save to model
        self.usecase.import_file = simple_uploaded_file
        self.usecase.save()

    def delete_usecase(self):
        self.saved_file_path = self.usecase.import_file.path
        self.usecase.delete()

    def test_add_usecase_file_then_delete(self):
        self.add_usecase()
        # then check that file has a path
        self.assertTrue(self.usecase.import_file.path != '')

        print('usecase saved filename: {}'.format(self.usecase.import_file.path))

        self.delete_usecase()
        self.assertFalse(os.path.exists(self.saved_file_path))

    def tearDown(self):
        # clean-up files on disk
        if self.schema and self.schema.id is not None:
            self.schema.delete()
