from django.core.urlresolvers import reverse
from django.test import TestCase
import json


class TestIndexView(TestCase):
    def test_view_url_exists_at_desired_location(self):
        resp = self.client.get('/bs/')
        self.assertEqual(resp.status_code, 200)

    def test_view_url_accessible_by_name(self):
        resp = self.client.get(reverse('buildingsync:index'))
        self.assertEqual(resp.status_code, 200)

    def test_view_uses_correct_template(self):
        resp = self.client.get(reverse('buildingsync:index'))
        self.assertEqual(resp.status_code, 200)
        self.assertTemplateUsed(resp, 'buildingsync/index.html')


class TestGetSchemaView(TestCase):
    def test_view_url_exists_at_desired_location(self):
        resp = self.client.get('/bs/get_schema/')
        self.assertEqual(resp.status_code, 200)

    def test_view_url_accessible_by_name(self):
        resp = self.client.get(reverse('buildingsync:get_schema'))
        self.assertEqual(resp.status_code, 200)

    def test_view_response_is_json(self):
        resp = self.client.get(reverse('buildingsync:get_schema'))
        self.assertEqual(resp.status_code, 200)
        try:
            json.loads(resp.content)
        except:
            self.fail('Response from get_schema was not proper json')


class TestGetUseCaseView(TestCase):
    def test_view_url_exists_at_desired_location(self):
        resp = self.client.get('/bs/get_use_cases/')
        self.assertEqual(resp.status_code, 200)

    def test_view_url_accessible_by_name(self):
        resp = self.client.get(reverse('buildingsync:get_use_cases'))
        self.assertEqual(resp.status_code, 200)

    def test_view_response_is_json(self):
        resp = self.client.get(reverse('buildingsync:get_use_cases'))
        self.assertEqual(resp.status_code, 200)
        try:
            json.loads(resp.content)
        except:
            self.fail('Response from get_use_cases was not proper json')
