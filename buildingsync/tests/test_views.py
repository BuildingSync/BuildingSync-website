from django.core.urlresolvers import reverse
from django.test import TestCase
import json
from buildingsync.models import UseCase


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
        resp = self.client.get('/bs/api/schemas/')
        self.assertEqual(resp.status_code, 200)

    def test_view_url_accessible_by_name(self):
        resp = self.client.get(reverse('buildingsync:schemas-list'))
        self.assertEqual(resp.status_code, 200)

    def test_view_response_is_json(self):
        resp = self.client.get(reverse('buildingsync:schemas-list'))
        self.assertEqual(resp.status_code, 200)
        try:
            json.loads(resp.content)
        except:  # pragma: no cover
            self.fail('Response from get_schema was not proper json')


class TestAttributesView(TestCase):
    def test_view_url_exists_at_desired_location(self):
        resp = self.client.get('/bs/api/attributes/')
        self.assertEqual(resp.status_code, 200)

    def test_view_url_accessible_by_name(self):
        resp = self.client.get(reverse('buildingsync:attributes-list'))
        self.assertEqual(resp.status_code, 200)

    def test_view_response_is_json(self):
        resp = self.client.get(reverse('buildingsync:attributes-list'))
        self.assertEqual(resp.status_code, 200)
        try:
            json.loads(resp.content)
        except:  # pragma: no cover
            self.fail('Response from get_attributes was not proper json')


class TestGetUseCaseView(TestCase):
    def test_view_url_exists_at_desired_location(self):
        resp = self.client.get('/bs/api/use_cases/')
        self.assertEqual(resp.status_code, 200)

    def test_view_url_accessible_by_name(self):
        resp = self.client.get(reverse('buildingsync:use_cases-list'))
        self.assertEqual(resp.status_code, 200)

    def test_view_response_is_json(self):
        UseCase.objects.create(nickname="my use case", show=True)
        resp = self.client.get(reverse('buildingsync:use_cases-list'))
        self.assertEqual(resp.status_code, 200)
        try:
            json.loads(resp.content)
        except:  # pragma: no cover
            self.fail('Response from get_use_cases was not proper json')
