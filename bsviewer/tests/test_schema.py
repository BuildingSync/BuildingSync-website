from random import randint
from shutil import copyfile
import os

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

    def test_to_template(self):
        # load in the schema
        data = self.schema.to_template()
        self.assertEqual(data[0], 'audits.Audit')
        self.assertEqual(data[1], 'audits.Audit.Sites')
