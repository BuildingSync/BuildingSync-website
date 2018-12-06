import csv
import json
import os
from random import randint
from shutil import copyfile
from django.test import TestCase
from bsyncviewer.lib.tree_viewer import get_schema_jstree_data
from bsyncviewer.models.schema import Schema
from django.conf import settings
DEFAULT_SCHEMA_VERSION = settings.DEFAULT_SCHEMA_VERSION


class TestSchema(TestCase):
    def setUp(self):
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

    def test_schema_parsed(self):
        # check that post_save worked: schema_parsed should be True and there should be attributes related to schema in db
        self.assertTrue(self.schema.schema_parsed)
        attributes = self.schema.attributes
        self.assertGreater(attributes.count(), 0)

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
        # template is generated automatically in post_save
        self.assertTrue(os.path.exists(self.schema.usecase_template_file.path))
        with open(self.schema.usecase_template_file.path) as csvfile:
            for index, row in enumerate(csv.reader(csvfile, delimiter=',')):
                if index == 0:
                    self.assertEqual('BuildingSyncPath', row[0])
                elif index == 1:
                    self.assertEqual('Audits', row[0])
                    self.assertEqual('Required', row[1])

    def test_schema_js_tree(self):
        # test the retrieval of the schema as a jstree for dictionary view
        js_tree = get_schema_jstree_data(DEFAULT_SCHEMA_VERSION)

        # assert that js_tree is a list, not-empty
        self.assertTrue(isinstance(js_tree, list))
        self.assertGreater(len(js_tree), 0)

        # ensure can be dumped to JSON
        json.dumps(js_tree)

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

    def tearDown(self):
        # clean-up files on disk
        if self.schema and self.schema.id is not None:
            self.schema.delete()
