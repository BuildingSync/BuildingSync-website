import json
import os

from django.core.files.uploadedfile import SimpleUploadedFile
from django.test import TestCase

from bsyncviewer.lib.tree_viewer import get_schema_jstree_data
from bsyncviewer.models.schema import Schema

# Use a custom version that is not an actual version to prevent overwriting saved BEDES mappings
TEST_SCHEMA_VERSION = '0.0.1'


class TestSchema(TestCase):
    def setUp(self):
        sf = os.path.join(os.path.dirname(__file__), 'data', 'test_schema.xsd')
        file = open(sf, 'rb')
        simple_uploaded_file = SimpleUploadedFile(file.name, file.read())

        self.schema = Schema(
            name='Version {}'.format(TEST_SCHEMA_VERSION),
            version=TEST_SCHEMA_VERSION,
            schema_file=simple_uploaded_file
        )
        self.schema.save()  # Calling save also processes the schema and generates the template

    def test_schema_parsed(self):
        # check that post_save worked: schema_parsed should be True and there should be attributes related to schema in db
        self.assertTrue(self.schema.schema_parsed)
        attributes = self.schema.attributes
        self.assertGreater(attributes.count(), 0)

    def test_enumerations(self):
        # check a couple of the attributes to make sure have enumerations
        test_path = 'BuildingSync.Facilities.Facility.Sites.Site.ClimateZoneType.ASHRAE.ClimateZone'

        attribute = self.schema.attributes.filter(path=test_path).first()
        self.assertIsNotNone(attribute)
        self.assertEqual(attribute.enumeration_classes.count(), 1)
        self.assertEqual(attribute.enumeration_classes.first().enumerations.count(), 17)
        self.assertEqual(
            attribute.enumeration_classes.first().enumerations.first().name, '1A'
        )

    def test_schema_js_tree(self):
        # test the retrieval of the schema as a jstree for dictionary view
        js_tree = get_schema_jstree_data(TEST_SCHEMA_VERSION)

        # assert that js_tree is a list, not-empty
        self.assertTrue(isinstance(js_tree, list))
        self.assertGreater(len(js_tree), 0)

        # ensure can be dumped to JSON
        json.dumps(js_tree)

    def test_cleanup(self):
        # test that physical files are cleaned up on disk

        schema_file_path = self.schema.schema_file.path

        # delete schema
        self.schema.delete()

        print('schema filepath: {}'.format(schema_file_path))

        # assert that physical files were also deleted
        self.assertFalse(os.path.isfile(schema_file_path))

    def tearDown(self):
        # clean-up files on disk
        if self.schema and self.schema.id is not None:
            self.schema.delete()
