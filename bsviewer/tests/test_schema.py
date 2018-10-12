import csv
import os

from django.conf import settings
from django.core.files.uploadedfile import SimpleUploadedFile
from django.test import TestCase

from bsviewer.models.schema import Schema

DEFAULT_SCHEMA_VERSION = settings.DEFAULT_SCHEMA_VERSION


class TestSchema(TestCase):
    def setUp(self):
        # self.schema = Schema.objects.filter(version='0.3').first()

        # schema file - make sure to create a copy since the version will be deleted if
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

    def test_schema_parsed(self):
        # check that post_save worked: schema_parsed should be True and there should be attributes related to schema in db
        self.assertTrue(self.schema.schema_parsed)
        attributes = self.schema.attributes
        self.assertGreater(attributes.count(), 0)

        # clean-up files on disk
        self.schema.delete()

    def test_enumerations(self):
        # check a couple of the attributes to make sure have enumerations
        test_path = 'Audits.Audit.Contacts.Contact.ContactRole'

        attribute = self.schema.attributes.filter(path=test_path).first()
        self.assertIsNotNone(attribute)
        self.assertEqual(attribute.enumeration_classes.count(), 1)
        self.assertEqual(attribute.enumeration_classes.first().enumerations.count(), 40)
        self.assertEqual(
            attribute.enumeration_classes.first().enumerations.first().name, 'Premises'
        )

        # clean-up files on disk
        self.schema.delete()

    def test_to_template(self):
        # template is generated automatically in post_save
        self.assertTrue(os.path.exists(self.schema.usecase_template_file.path))
        with open(self.schema.usecase_template_file.path) as csvfile:
            for index, row in enumerate(csv.reader(csvfile, delimiter=',')):
                if index == 0:
                    self.assertEqual('BuildingSyncPath', row[0])
                elif index == 1:
                    self.assertEqual('Audits', row[0])
                    self.assertEqual('Required', row[1])

        # clean-up files on disk
        self.schema.delete()

    def test_cleanup(self):
        # test that physical files are cleaned up on disk

        schema_file_path = self.schema.schema_file.path
        usecase_template_file_path = self.schema.usecase_template_file.path

        # delete schema
        self.schema.delete()

        print('schema filepath: {}'.format(schema_file_path))
        print('usecase template filepath: {}'.format(usecase_template_file_path))

        # assert that physical files were also deleted
        self.assertFalse(os.path.isfile(schema_file_path))
        self.assertFalse(os.path.isfile(usecase_template_file_path))
