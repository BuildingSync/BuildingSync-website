import os
from io import StringIO

from django.conf import settings
from django.core.files.uploadedfile import SimpleUploadedFile
from django.core.management import call_command
from django.template.loader import render_to_string
from django.test import Client, SimpleTestCase, TestCase, override_settings
from django.urls import reverse

from bsyncviewer.models.attribute import Attribute
from bsyncviewer.models.bedes_models import BedesEnumeration, BedesMapping, BedesTerm
from bsyncviewer.models.schema import Schema

# Use a custom version that is not an actual version to prevent overwriting saved BEDES mappings
TEST_SCHEMA_VERSION = "0.0.1"


class GoogleAnalyticsTemplateTests(SimpleTestCase):
    @override_settings(DEBUG=False, GOOGLE_ANALYTICS_MEASUREMENT_ID="G-P8CNFE9GY2")
    def test_tracking_enabled_in_both_layouts(self):
        for template_name in ("base.html", "base2.html"):
            with self.subTest(template_name=template_name):
                content = render_to_string(template_name)
                self.assertEqual(
                    content.count(
                        "https://www.googletagmanager.com/gtag/js?id=G-P8CNFE9GY2"
                    ),
                    1,
                )
                self.assertEqual(
                    content.count("gtag('config', 'G\\u002DP8CNFE9GY2');"), 1
                )

    @override_settings(DEBUG=True, GOOGLE_ANALYTICS_MEASUREMENT_ID="G-P8CNFE9GY2")
    def test_tracking_disabled_in_development(self):
        for template_name in ("base.html", "base2.html"):
            with self.subTest(template_name=template_name):
                self.assertNotIn("googletagmanager", render_to_string(template_name))

    @override_settings(DEBUG=False, GOOGLE_ANALYTICS_MEASUREMENT_ID="")
    def test_tracking_disabled_without_measurement_id(self):
        for template_name in ("base.html", "base2.html"):
            with self.subTest(template_name=template_name):
                self.assertNotIn("googletagmanager", render_to_string(template_name))


class BsyncviewerViewTests(TestCase):
    def test_index_ok(self):
        response = self.client.get(reverse("index"))
        print("Testing Index page OK")
        self.assertEqual(response.status_code, 200)

    def test_validator_ok(self):
        response = self.client.get(reverse("validator"))
        print("Testing Validator page OK")
        self.assertEqual(response.status_code, 200)

    def test_use_cases_ok(self):
        response = self.client.get(reverse("cases"))
        print("Testing Cases page OK")
        self.assertEqual(response.status_code, 200)

    # The default redirect is to 1.0.0 but we are not loading that schema anymore.
    # def test_dictionary_redirect(self):
    #     self.add_schema()
    #     response = self.client.get(reverse('dictionary'))
    #     print('Testing Dictionary page redirect')
    #     redirect_url = '/dictionary/{}/'.format('0.0.1')
    #     self.assertRedirects(response, redirect_url)
    #
    #     # clean-up files on disk
    #     self.schema.delete()

    # this should redirect to the default schema version
    def test_dictionary_404_when_no_schema(self):
        response = self.client.get(reverse("dictionary"))
        print("Testing Dictionary page redirect")
        redirect_url = "/dictionary/{}/".format(settings.DEFAULT_SCHEMA_VERSION)
        self.assertRedirects(response, redirect_url, target_status_code=404)

    def test_bedes_ajax_call(self):
        # need schema and bedes imported
        self.add_schema()
        self.add_bedes_mapping()

        # get 1st bedes enumeration
        benum = BedesEnumeration.objects.filter(term="Cold")
        print("first benum: {}".format(benum[:1].values()))
        benum = benum[0]
        # get related bedes term
        bterm = BedesTerm.objects.filter(content_uuid=benum.related_term_uuid)
        print("bterm: {}".format(bterm[:1].values()))
        bterm = bterm[0]
        # get attribute
        mapping = BedesMapping.objects.filter(bedesTerm_id=bterm.pk)[0]
        print(
            "mapping: {}, bedestermid: {}, attributeid: {}".format(
                mapping.id, mapping.bedesTerm_id, mapping.attribute_id
            )
        )

        attrb = Attribute.objects.get(id=mapping.attribute_id)
        print("attribute: {}".format(attrb))

        client = Client()
        response = client.get(
            "/ajax/enum/",
            {"element_id": mapping.attribute_id},
            content_type="application/json",
            HTTP_X_REQUESTED_WITH="XMLHttpRequest",
        )
        print("RESPONSE: {}".format(response.status_code))
        code_str = str(response.status_code)
        self.assertEqual(code_str, "200")
        print("RESPONSE CONTENT: {}".format(response.content))
        self.assertContains(response, "bedes_term")
        self.assertContains(response, "has_enum")
        self.assertContains(response, "enums")

        # clean-up files on disk
        self.schema.delete()

    def add_schema(self):
        self.schema = Schema.objects.filter(version=TEST_SCHEMA_VERSION).first()
        if not self.schema:
            # add schema file - make sure to create a copy since the version will be deleted if
            # the schema is deleted
            sf = os.path.join(os.path.dirname(__file__), "data", "test_schema.xsd")
            file = open(sf, "rb")
            simple_uploaded_file = SimpleUploadedFile(file.name, file.read())

            self.schema = Schema(
                name="Version {}".format(TEST_SCHEMA_VERSION),
                version=TEST_SCHEMA_VERSION,
                schema_file=simple_uploaded_file,
            )
            self.schema.save()  # Calling save also processes the schema and generates the template

    def add_bedes_mapping(self):
        # create the CSV files
        out = StringIO()
        print("VERSION: {}".format(TEST_SCHEMA_VERSION))
        call_command(
            "bedes",
            schema_version=TEST_SCHEMA_VERSION,
            bedes_version="v2.2",
            stdout=out,
        )

        # add to database
        call_command(
            "bedes",
            schema_version=TEST_SCHEMA_VERSION,
            bedes_version="v2.2",
            save_to_db=True,
            stdout=out,
        )

    # TODO: test that you can't add a use case if not authenticated
    # TODO: test that you can add one when authenticated
