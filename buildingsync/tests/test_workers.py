from django.test import TestCase

from buildingsync.workers import reset_schema
from buildingsync.models import Schema  # , BuildingSyncAttribute


class TestResetSchema(TestCase):
    def test_reset_schema(self):
        resp = reset_schema()
        self.assertEqual(resp.name, 'BuildingSync, Version 0.2')
        self.assertEqual(resp.id, 1)
        self.assertEqual(resp.version, '0.2')
        self.assertEqual(len(Schema.objects.all()), 1)
        # self.assertEqual(len(BuildingSyncAttribute.objects.all()), 2944)  # TODO: This is wrong :)
