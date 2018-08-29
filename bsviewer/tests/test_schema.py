import os
import csv
from random import randint
from shutil import copyfile

from django.test import TestCase

from bsviewer.models.schema import Schema


class TestSchema(TestCase):
    def setUp(self):
        self.schema = Schema.objects.filter(version='0.3').first()

        # schema file - make sure to create a copy since the version will be deleted if
        # the schema is deleted
        sf = os.path.join(os.path.dirname(__file__), 'data', 'test_schema.xsd')
        schema_file = os.path.join(
            os.path.dirname(__file__), 'data', 'schema_file_%s' % randint(0, 10000)
        )
        copyfile(sf, schema_file)
        self.schema = Schema(
            name='Version 0.3',
            version='0.3',
            schema_file=schema_file
        )
        self.schema.save()  # Calling save also processes the schema

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

    def test_to_template(self):
        filename = self.schema.save_template()
        self.assertTrue(os.path.exists(filename))
        with open(filename) as csvfile:
            for index, row in enumerate(csv.reader(csvfile, delimiter=',')):
                if index == 0:
                    self.assertEqual('BuildingSync Path', row[0])
                elif index == 1:
                    self.assertEqual('Audits.Audit', row[0])
                    self.assertEqual('Required', row[1])
