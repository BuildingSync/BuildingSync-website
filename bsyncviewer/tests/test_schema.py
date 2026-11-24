import json
import os

import xmlschema
from django.core.files.uploadedfile import SimpleUploadedFile
from django.test import SimpleTestCase, TestCase

from bsyncviewer.lib.schema_parser import BuildingSyncSchemaProcessor
from bsyncviewer.lib.tree_viewer import get_schema_jstree_data
from bsyncviewer.models.schema import Schema

# Use a custom version that is not an actual version to prevent overwriting saved BEDES mappings
TEST_SCHEMA_VERSION = "0.0.1"

REF_NAMED_COMPLEX_TYPE_XSD = """<?xml version="1.0" encoding="UTF-8"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:auc="http://buildingsync.net/schemas/bedes-auc/2019"
    targetNamespace="http://buildingsync.net/schemas/bedes-auc/2019"
    elementFormDefault="qualified">
  <xs:element name="BuildingSync">
    <xs:complexType>
      <xs:sequence>
        <xs:element ref="auc:Widget" minOccurs="0"/>
        <xs:element name="LocalWidget" type="auc:WidgetType" minOccurs="0"/>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
  <xs:element name="Widget" type="auc:WidgetType"/>
  <xs:complexType name="WidgetType">
    <xs:sequence>
      <xs:element name="Color" minOccurs="0">
        <xs:simpleType>
          <xs:restriction base="xs:string">
            <xs:enumeration value="Red"/>
            <xs:enumeration value="Blue"/>
          </xs:restriction>
        </xs:simpleType>
      </xs:element>
      <xs:element name="Size" type="xs:string" minOccurs="0"/>
    </xs:sequence>
  </xs:complexType>
</xs:schema>
"""


class TestRefNamedComplexType(SimpleTestCase):
    """Regression test for issue #229."""

    def setUp(self):
        processor = BuildingSyncSchemaProcessor(
            xmlschema.XMLSchema(REF_NAMED_COMPLEX_TYPE_XSD)
        )
        self.rows = processor.walk_root_element()
        self.elements = {
            row["path"]: row for row in self.rows if row["type"] != "Enumeration"
        }

    def test_ref_element_children_are_walked(self):
        for parent in ("Widget", "LocalWidget"):
            parent_path = "BuildingSync." + parent
            self.assertEqual(self.elements[parent_path]["$$treeLevel"], 0)
            for child in ("Color", "Size"):
                row = self.elements["{}.{}".format(parent_path, child)]
                self.assertEqual(row["parent_path"], parent_path)
                self.assertEqual(row["$$treeLevel"], 1)

    def test_ref_element_child_enumerations(self):
        enums = [
            row["name"]
            for row in self.rows
            if row["type"] == "Enumeration"
            and row["path"] == "BuildingSync.Widget.Color"
        ]
        self.assertEqual(enums, ["Red", "Blue"])

    def test_rows_are_not_duplicated(self):
        paths = [row["path"] for row in self.rows if row["type"] != "Enumeration"]
        self.assertEqual(len(paths), len(set(paths)))
        indices = [row["index"] for row in self.rows]
        self.assertEqual(indices, list(range(1, len(self.rows) + 1)))


class TestSchema(TestCase):
    def setUp(self):
        sf = os.path.join(os.path.dirname(__file__), "data", "test_schema.xsd")
        file = open(sf, "rb")
        simple_uploaded_file = SimpleUploadedFile(file.name, file.read())

        self.schema = Schema(
            name="Version {}".format(TEST_SCHEMA_VERSION),
            version=TEST_SCHEMA_VERSION,
            schema_file=simple_uploaded_file,
        )
        self.schema.save()  # Calling save also processes the schema and generates the template

    def test_schema_parsed(self):
        # check that post_save worked: schema_parsed should be True and there should be attributes related to schema in db
        self.assertTrue(self.schema.schema_parsed)
        attributes = self.schema.attributes
        self.assertGreater(attributes.count(), 0)

    def test_enumerations(self):
        # check a couple of the attributes to make sure have enumerations
        test_path = "BuildingSync.Facilities.Facility.Sites.Site.ClimateZoneType.ASHRAE.ClimateZone"

        attribute = self.schema.attributes.filter(path=test_path).first()
        self.assertIsNotNone(attribute)
        self.assertEqual(attribute.enumeration_classes.count(), 1)
        self.assertEqual(attribute.enumeration_classes.first().enumerations.count(), 17)
        self.assertEqual(
            attribute.enumeration_classes.first().enumerations.first().name, "1A"
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

        print("schema filepath: {}".format(schema_file_path))

        # assert that physical files were also deleted
        self.assertFalse(os.path.isfile(schema_file_path))

    def tearDown(self):
        # clean-up files on disk
        if self.schema and self.schema.id is not None:
            self.schema.delete()
