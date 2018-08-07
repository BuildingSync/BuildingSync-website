import json

from django.contrib.auth.models import User
from django.core.urlresolvers import reverse
from django.test import TestCase


class TestGetSchemaViewsAnonymous(TestCase):
    def test_get_schema_view(self):
        resp = self.client.get('/api/schemas/')
        self.assertEqual(resp.status_code, 200)


class TestGetSchemaView(TestCase):
    def setUp(self):
        User.objects.create_user(username='username', password='password')
        self.client.login(username='username', password='password')

    def test_view_url_exists_at_desired_location(self):
        resp = self.client.get('/api/schemas/')
        self.assertEqual(resp.status_code, 200)

    def test_view_url_accessible_by_name(self):
        resp = self.client.get(reverse('buildingsync:schemas-list'))
        self.assertEqual(resp.status_code, 200)

    def test_view_response_is_json(self):
        resp = self.client.get(reverse('buildingsync:schemas-list'))
        self.assertEqual(resp.status_code, 200)
        try:
            json.loads(resp.content)
        except BaseException:  # pragma: no cover
            self.fail('Response from get_schema was not proper json')


class TestGenerateSchemaViewAnonymous(TestCase):
    def test_generate_schema(self):
        resp = self.client.get('/api/schemas/initialize_schema/')
        self.assertEqual(resp.status_code, 302)


class TestGenerateSchemaView(TestCase):
    def setUp(self):
        User.objects.create_user(username='username', password='password')
        self.client.login(username='username', password='password')

    def test_view_url_exists_at_desired_location(self):
        resp = self.client.get('/api/schemas/initialize_schema/')
        self.assertEqual(resp.status_code, 200)
