import os
from random import randint
from shutil import copyfile
from io import StringIO
from django.core.management import call_command
from django.test import Client, TestCase
from django.urls import reverse
from bsviewer.models.schema import Schema
from bsviewer.models.bedes_models import BedesEnumeration, BedesTerm, BedesMapping
from bsviewer.models.attribute import Attribute

from django.conf import settings
DEFAULT_SCHEMA_VERSION = settings.DEFAULT_SCHEMA_VERSION


class BsviewerViewTests(TestCase):
    def test_index_ok(self):
        response = self.client.get(reverse('index'))
        print('Testing Index page OK')
        self.assertEqual(response.status_code, 200)

    def test_validator_ok(self):
        response = self.client.get(reverse('validator'))
        print('Testing Validator page OK')
        self.assertEqual(response.status_code, 200)

    def test_use_cases_ok(self):
        response = self.client.get(reverse('cases'))
        print('Testing Cases page OK')
        self.assertEqual(response.status_code, 200)

    def test_dictionary_redirect(self):
        self.add_schema()
        response = self.client.get(reverse('dictionary'))
        print('Testing Dictionary page redirect')
        redirect_url = '/dictionary/{}/'.format(DEFAULT_SCHEMA_VERSION)
        self.assertRedirects(response, redirect_url)

        # clean-up files on disk
        self.schema.delete()

    def test_dictionary_404_when_no_schema(self):
        response = self.client.get(reverse('dictionary'))
        print('Testing Dictionary page redirect')
        redirect_url = '/dictionary/{}/'.format(DEFAULT_SCHEMA_VERSION)
        self.assertRedirects(response, redirect_url, target_status_code=404)

    def test_bedes_ajax_call(self):

        # need schema and bedes imported
        self.add_schema()
        self.add_bedes_mapping()

        # get 1st bedes enumeration
        benum = BedesEnumeration.objects.filter(term='Cold')
        print('first benum: {}'.format(benum[:1].values()))
        benum = benum[0]
        # get related bedes term
        bterm = BedesTerm.objects.filter(content_uuid=benum.related_term_uuid)
        print('bterm: {}'.format(bterm[:1].values()))
        bterm = bterm[0]
        # get attribute
        mapping = BedesMapping.objects.filter(bedesTerm_id=bterm.pk)[0]
        print('mapping: {}, bedestermid: {}, attributeid: {}'.format(mapping.id, mapping.bedesTerm_id, mapping.attribute_id))

        attrb = Attribute.objects.get(id=mapping.attribute_id)
        print('attribute: {}'.format(attrb))

        client = Client()
        response = client.get('/ajax/enum/', {'element_id': mapping.attribute_id},
                              content_type='application/json',
                              HTTP_X_REQUESTED_WITH='XMLHttpRequest')
        print("RESPONSE: {}".format(response.status_code))
        code_str = str(response.status_code)
        self.assertEqual(code_str, '200')
        print("RESPONSE CONTENT: {}".format(response.content))
        self.assertContains(response, 'bedes_term')
        self.assertContains(response, 'has_enum')
        self.assertContains(response, 'enums')

        # clean-up files on disk
        self.schema.delete()

    def add_schema(self):
        self.schema = Schema.objects.filter(version=DEFAULT_SCHEMA_VERSION).first()
        if not self.schema:
            # add schema file - make sure to create a copy since the version will be deleted if
            # the schema is deleted
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

    def add_bedes_mapping(self):
        # create the CSV files
        out = StringIO()
        print("VERSION: {}".format(DEFAULT_SCHEMA_VERSION))
        call_command('bedes', schema_version=DEFAULT_SCHEMA_VERSION, bedes_version='v1.2', stdout=out)

        # add to database
        call_command('bedes', schema_version=DEFAULT_SCHEMA_VERSION, bedes_version='v1.2', save_to_db=True, stdout=out)

    # TODO: test that you can't add a use case if not authenticated
    # TODO: test that you can add one when authenticated
