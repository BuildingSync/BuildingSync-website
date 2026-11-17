import os
from io import StringIO

from django.core.files.uploadedfile import SimpleUploadedFile
from django.core.management import call_command
from django.core.management.base import CommandError
from django.test import TestCase

from bsyncviewer.models.attribute import Attribute
from bsyncviewer.models.bedes_models import (
    BedesEnumeration,
    BedesEnumerationMapping,
    BedesMapping,
    BedesTerm,
)
from bsyncviewer.models.enumeration import Enumeration
from bsyncviewer.models.schema import Schema
from bsyncviewer.models.use_case import UseCase

# Use a custom version that is not an actual version to prevent overwriting saved BEDES mappings
TEST_SCHEMA_VERSION = "0.0.2"
MAPPED_PATH = "BuildingSync.FanBased.AirSideEconomizer"


class TestReparseSchemaCommand(TestCase):
    def setUp(self):
        sf = os.path.join(
            os.path.dirname(__file__), "data", "test_ref_complex_type.xsd"
        )
        with open(sf, "rb") as file:
            uploaded = SimpleUploadedFile(file.name, file.read())
        self.schema = Schema(
            name="Version {}".format(TEST_SCHEMA_VERSION),
            version=TEST_SCHEMA_VERSION,
            schema_file=uploaded,
        )
        self.schema.save()  # Calling save also processes the schema

        self.use_case = UseCase.objects.create(name="reparse-test", schema=self.schema)

        self.term = BedesTerm.objects.create(
            content_uuid="term-uuid", term="Economizer", category="", url=""
        )
        self.attribute = Attribute.objects.get(schema=self.schema, path=MAPPED_PATH)
        BedesMapping.objects.create(
            attribute=self.attribute, bedesTerm=self.term, match_type="Term"
        )

        self.enumeration = Enumeration.objects.filter(
            schema=self.schema, name="Dry bulb temperature"
        ).first()
        self.enum_class_name = self.enumeration.enumeration_class.name
        self.bedes_enum = BedesEnumeration.objects.create(
            content_uuid="enum-uuid", term="Dry Bulb", url="", related_term_uuid=""
        )
        BedesEnumerationMapping.objects.create(
            enumeration=self.enumeration, bedesEnumeration=self.bedes_enum
        )

    def tearDown(self):
        if self.schema and self.schema.id is not None:
            self.schema.delete()

    def _reparse(self, *args):
        out = StringIO()
        call_command(
            "reparse_schema", "--schema_version", TEST_SCHEMA_VERSION, *args, stdout=out
        )
        return out.getvalue()

    def test_reparse_rebuilds_tree_and_keeps_schema_and_use_cases(self):
        old_ids = set(
            Attribute.objects.filter(schema=self.schema).values_list("id", flat=True)
        )
        old_paths = sorted(
            Attribute.objects.filter(schema=self.schema).values_list("path", flat=True)
        )

        self._reparse()

        attributes = Attribute.objects.filter(schema=self.schema)
        self.assertTrue(Schema.objects.filter(pk=self.schema.pk).exists())
        self.assertTrue(UseCase.objects.filter(pk=self.use_case.pk).exists())
        self.assertEqual(sorted(attributes.values_list("path", flat=True)), old_paths)
        self.assertEqual(attributes.filter(path="BuildingSync").count(), 1)
        self.assertFalse(old_ids & set(attributes.values_list("id", flat=True)))
        self.assertTrue(Schema.objects.get(pk=self.schema.pk).schema_parsed)

    def test_reparse_restores_bedes_mappings(self):
        self._reparse()

        mapping = BedesMapping.objects.get(attribute__schema=self.schema)
        self.assertEqual(mapping.attribute.path, MAPPED_PATH)
        self.assertNotEqual(mapping.attribute_id, self.attribute.id)
        self.assertEqual(mapping.bedesTerm_id, self.term.id)
        self.assertEqual(mapping.match_type, "Term")

        enum_mapping = BedesEnumerationMapping.objects.get(
            enumeration__schema=self.schema
        )
        self.assertEqual(enum_mapping.enumeration.name, "Dry bulb temperature")
        self.assertEqual(
            enum_mapping.enumeration.enumeration_class.name, self.enum_class_name
        )
        self.assertNotEqual(enum_mapping.enumeration_id, self.enumeration.id)
        self.assertEqual(enum_mapping.bedesEnumeration_id, self.bedes_enum.id)

    def test_reparse_restores_enum_mapping_when_class_is_renamed(self):
        # class names become "Parent::Leaf" when a leaf name gains a second parent, so the
        # mapping must be carried over by attribute path, not only by class name
        enum_class = self.enumeration.enumeration_class
        enum_class.name = "Renamed::AirSideEconomizer"
        enum_class.save()

        self._reparse()

        enum_mapping = BedesEnumerationMapping.objects.get(
            enumeration__schema=self.schema
        )
        self.assertEqual(enum_mapping.enumeration.name, "Dry bulb temperature")
        self.assertNotEqual(
            enum_mapping.enumeration.enumeration_class.name, enum_class.name
        )
        self.assertEqual(enum_mapping.bedesEnumeration_id, self.bedes_enum.id)

    def test_reparse_reports_mappings_that_cannot_be_restored(self):
        gone = Attribute.objects.create(
            name="Gone",
            schema=self.schema,
            tree_level=1,
            path="BuildingSync.Gone",
        )
        BedesMapping.objects.create(attribute=gone, bedesTerm=self.term)

        output = self._reparse()

        self.assertIn("not restored", output)
        self.assertIn("BuildingSync.Gone", output)
        self.assertEqual(
            BedesMapping.objects.filter(attribute__schema=self.schema).count(), 1
        )

    def test_dry_run_changes_nothing(self):
        old_ids = sorted(
            Attribute.objects.filter(schema=self.schema).values_list("id", flat=True)
        )

        output = self._reparse("--dry-run")

        self.assertIn("Dry run", output)
        self.assertEqual(
            sorted(
                Attribute.objects.filter(schema=self.schema).values_list(
                    "id", flat=True
                )
            ),
            old_ids,
        )
        self.assertEqual(
            BedesMapping.objects.get(attribute__schema=self.schema).attribute_id,
            self.attribute.id,
        )

    def test_unknown_version_raises(self):
        with self.assertRaises(CommandError):
            call_command(
                "reparse_schema", "--schema_version", "9.9.9", stdout=StringIO()
            )
