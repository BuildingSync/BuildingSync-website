import os

from django.conf import settings
from django.core.files.uploadedfile import SimpleUploadedFile
from django.test import Client, TestCase

from bsyncviewer.forms import LoadXMLFile, LoadXMLExample
from bsyncviewer.lib.validator.workflow import ValidationWorkflow
from bsyncviewer.models.schema import Schema

DEFAULT_SCHEMA_VERSION = settings.DEFAULT_SCHEMA_VERSION


class TestValidator(TestCase):
    def setUp(self):
        self.schema = Schema.objects.filter(version=DEFAULT_SCHEMA_VERSION).first()
        if not self.schema:
            # add schema file - make sure to create a copy since the version will be deleted if
            # the schema is deleted
            sf = os.path.join(os.path.dirname(__file__), 'data', 'test_schema.xsd')
            file = open(sf, 'rb')
            simple_uploaded_file = SimpleUploadedFile(file.name, file.read())

            self.schema = Schema(
                name='Version {}'.format(DEFAULT_SCHEMA_VERSION),
                version=DEFAULT_SCHEMA_VERSION,
                schema_file=simple_uploaded_file
            )
            self.schema.save()  # Calling save also processes the schema and generates the template

    def test_init_forms(self):
        # test form init
        LoadXMLFile()
        LoadXMLExample()

    # TODO: test uploading a file through the form
    # def test_file_form_valid_data(self):
    #     form_data = {
    #         'schema_version': DEFAULT_SCHEMA_VERSION,
    #         'form_type': 'file'
    #     }
    #     form = LoadXMLExample(data=form_data)
    #     print("FORM: {}".format(form))
    #     print("VALID? {}".format(form.is_valid()))
    #     self.assertTrue(form.is_valid())

    def test_file_form_no_data(self):
        form_data = {
        }
        form = LoadXMLFile(data=form_data)
        self.assertFalse(form.is_valid())
        self.assertEqual(form.errors, {
            'schema_version': ['This field is required.'],
            'file': ['This field is required.'],
            'form_type': ['This field is required.']
        })

    def test_example_form_no_data(self):
        form_data = {
        }
        form = LoadXMLExample(data=form_data)
        self.assertFalse(form.is_valid())
        self.assertEqual(form.errors, {
            'schema_version': ['This field is required.'],
            'file_name': ['This field is required.'],
            'form_type': ['This field is required.']
        })

    def test_example_form_valid_data(self):
        head, tail = os.path.split(os.path.dirname(__file__))
        file_name = os.path.join(head, 'lib', 'validator', 'examples', 'example_schemaValid.xml')

        form_data = {
            'schema_version': DEFAULT_SCHEMA_VERSION,
            'form_type': 'example',
            'file_name': file_name
        }

        client = Client()
        response = client.post('/validator', form_data)
        self.assertEqual(response.status_code, 200)

    def test_validator_workflow(self):
        version = DEFAULT_SCHEMA_VERSION
        head, tail = os.path.split(os.path.dirname(__file__))
        filepath = os.path.join(head, 'lib', 'validator', 'examples', 'example_schemaValid.xml')
        f = open(filepath, 'r')
        workflow = ValidationWorkflow(f, filepath, version)
        validation_results = workflow.validate_all()
        print("VAL: {}".format(validation_results))
        self.assertIn('schema', validation_results)
        self.assertIn('use_cases', validation_results)

    def tearDown(self):
        # clean-up files on disk
        if self.schema and self.schema.id is not None:
            self.schema.delete()