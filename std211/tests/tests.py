# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import os

from django.contrib.auth.models import User
from django.test import TestCase

from std211.models import Standard211Instance


class TestStandard211(TestCase):
    def setUp(self):
        self.user = User.objects.create_user(username='username', password='password')
        self.client.login(username='username', password='password')
        self.std211_file = os.path.join(os.path.dirname(__file__), 'data',
                                        'std211_normative_form_20170328.xlsx')

    def test_create_data(self):
        s = Standard211Instance.objects.create(owner_id=self.user.id)

        dict = Standard211Instance.spreadsheet_to_dictionary(self.std211_file)
        self.assertEqual(dict["All - Building"]["City*"], "Atlanta")
        # import json
        # print json.dumps(dict, indent=2)

    def test_to_buildingsync(self):
        dict = Standard211Instance.spreadsheet_to_dictionary(self.std211_file)
        xml = Standard211Instance.dictionary_to_xml(dict)

        self.assertTrue("<PremisesName>Test Building Input Data</PremisesName>" in xml)
        self.assertTrue("<PostalCodePlus4>99999-9999</PostalCodePlus4>" in xml)
        self.assertTrue("<FieldName>ASHRAE Standard 211 Role</FieldName>" in xml)
        # print(xml)
