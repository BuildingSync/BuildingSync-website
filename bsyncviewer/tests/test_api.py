import os

from bsyncviewer.models.schema import Schema
from django.core.files.uploadedfile import SimpleUploadedFile
from django.urls import reverse
from rest_framework import status
from rest_framework.test import APITestCase

# Use a custom version that is not an actual version to prevent overwriting saved BEDES mappings
TEST_SCHEMA_VERSION = '0.0.1'


class TestApi(APITestCase):
    def setUp(self):
        self.schema = Schema.objects.filter(version=TEST_SCHEMA_VERSION).first()
        if not self.schema:
            # add schema file - make sure to create a copy since the version will be deleted if
            # the schema is deleted
            sf = os.path.join(os.path.dirname(__file__), 'data', 'test_schema.xsd')
            file = open(sf, 'rb')
            simple_uploaded_file = SimpleUploadedFile(file.name, file.read())

            self.schema = Schema(
                name='Version {}'.format(TEST_SCHEMA_VERSION),
                version=TEST_SCHEMA_VERSION,
                schema_file=simple_uploaded_file
            )
            self.schema.save()  # Calling save also processes the schema and generates the template

        print("SETUP COMPLETE")

    def test_validator_api(self):
        print("START OF TEST_VALIDATOR_API")

        head, tail = os.path.split(os.path.dirname(__file__))
        filepath = os.path.join(os.path.join(os.path.dirname(__file__), 'data', 'test_valid_schema.xml'))
        f = open(filepath, 'rb')
        simple_uploaded_file = SimpleUploadedFile(f.name, f.read())

        data = {'schema_version': TEST_SCHEMA_VERSION, 'file': simple_uploaded_file}

        url = reverse('validate_api')
        print("URL: {}".format(url))
        response = self.client.post(url, data, format='multipart')

        print("RESPONSE STATUS CODE: {}".format(response.status_code))
        print("RESPONSE CONTENT: {}".format(response.data))
        # assert that the call worked
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        # assert that the schema validates
        valid_schema = response.data['validation_results']['schema']['valid']
        print("VALID SCHEMA? {}".format(valid_schema))
        self.assertTrue(valid_schema)

    def test_validator_zip_api(self):
        print("START OF TEST_VALIDATOR_ZIP_API")

        head, tail = os.path.split(os.path.dirname(__file__))
        filepath = os.path.join(os.path.join(os.path.dirname(__file__), 'data', 'example_files.zip'))
        f = open(filepath, 'rb')
        simple_uploaded_file = SimpleUploadedFile(f.name, f.read())

        data = {'schema_version': TEST_SCHEMA_VERSION, 'file': simple_uploaded_file}

        url = reverse('validate_api')
        print("URL: {}".format(url))
        response = self.client.post(url, data, format='multipart')

        print("RESPONSE STATUS CODE: {}".format(response.status_code))
        print("RESPONSE CONTENT: {}".format(response.data))
        # assert that the call worked
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        # assert that the schema validates
        valid_schema = response.data['all_files_valid']
        print("VALID SCHEMA? {}".format(valid_schema))
        self.assertTrue(valid_schema)

    def tearDown(self):
        # clean-up files on disk
        print("IN TEAR DOWN NOW")
        if self.schema and self.schema.id is not None:
            self.schema.delete()
