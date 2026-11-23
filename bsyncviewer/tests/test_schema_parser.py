import os

import xmlschema
from django.test import SimpleTestCase

from bsyncviewer.lib.schema_parser import BuildingSyncSchemaProcessor


class TestSchemaParser(SimpleTestCase):
    def setUp(self):
        xsd = os.path.join(
            os.path.dirname(__file__), "data", "test_ref_complex_type.xsd"
        )
        processor = BuildingSyncSchemaProcessor(xmlschema.XMLSchema(xsd))
        self.rows = processor.walk_root_element()

    def _children(self, parent_path):
        return [r["name"] for r in self.rows if r["parent_path"] == parent_path]

    def _paths(self):
        return {r["path"] for r in self.rows}

    def test_ref_to_global_element_with_named_complex_type(self):
        # <xs:element ref="auc:FanBased"/> -> <xs:element name="FanBased" type="auc:FanBasedType"/>
        self.assertEqual(
            self._children("BuildingSync.FanBased"),
            ["FanBasedDistributionType", "AirSideEconomizer"],
        )
        self.assertEqual(
            self._children("BuildingSync.FanBased.FanBasedDistributionType"),
            ["AirDistribution", "FanCoil"],
        )
        self.assertEqual(
            self._children("BuildingSync.FanBased.AirSideEconomizer"),
            ["Dry bulb temperature", "None"],
        )

    def test_ref_matches_local_named_element_with_same_type(self):
        # the ref'd element and a local name+type element of the same type expand identically
        ref_paths = {
            p[len("BuildingSync.FanBased") :]
            for p in self._paths()
            if p.startswith("BuildingSync.FanBased.")
        }
        local_paths = {
            p[len("BuildingSync.LocalFanBased") :]
            for p in self._paths()
            if p.startswith("BuildingSync.LocalFanBased.")
        }
        self.assertGreater(len(ref_paths), 0)
        self.assertEqual(ref_paths, local_paths)

    def test_tree_levels_and_indexes(self):
        # enumeration rows reuse their parent's path, so leave them out of the lookup
        by_path = {r["path"]: r for r in self.rows if r["type"] != "Enumeration"}
        self.assertEqual(by_path["BuildingSync.FanBased"]["$$treeLevel"], 0)
        self.assertEqual(
            by_path["BuildingSync.FanBased.AirSideEconomizer"]["$$treeLevel"], 1
        )
        indexes = [r["index"] for r in self.rows]
        self.assertEqual(indexes, list(range(1, len(self.rows) + 1)))
