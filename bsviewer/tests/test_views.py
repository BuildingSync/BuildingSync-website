import os

from random import randint
from shutil import copyfile

from django.test import TestCase
from django.urls import reverse
from bsviewer.models.schema import Schema

from django.conf import settings
DEFAULT_SCHEMA_VERSION = settings.DEFAULT_SCHEMA_VERSION


class BsviewerViewTests(TestCase):
    def test_index_ok(self):
        response = self.client.get(reverse('bsviewer:index'))
        print('Testing Index page OK')
        self.assertEqual(response.status_code, 200)

    def test_validator_ok(self):
        response = self.client.get(reverse('bsviewer:validator'))
        print('Testing Validator page OK')
        self.assertEqual(response.status_code, 200)

    def test_use_cases_ok(self):
        response = self.client.get(reverse('bsviewer:cases'))
        print('Testing Cases page OK')
        self.assertEqual(response.status_code, 200)

    def test_dictionary_redirect(self):
        self.add_schema()
        response = self.client.get(reverse('bsviewer:dictionary'))
        print('Testing Dictionary page redirect')
        redirect_url = '/viewers/dictionary/{}/'.format(DEFAULT_SCHEMA_VERSION)
        self.assertRedirects(response, redirect_url)

        # clean-up files on disk
        self.schema.delete()

    def test_dictionary_404_when_no_schema(self):
        response = self.client.get(reverse('bsviewer:dictionary'))
        print('Testing Dictionary page redirect')
        redirect_url = '/viewers/dictionary/{}/'.format(DEFAULT_SCHEMA_VERSION)
        self.assertRedirects(response, redirect_url, target_status_code=404)

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

    # TODO: test that you can't add a use case if not authenticated
    # TODO: test that you can add one when authenticated