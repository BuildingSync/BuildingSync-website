import json

from django.contrib.auth.models import User
from django.core.urlresolvers import reverse
from django.test import TestCase

from buildingsync.models import UseCase


class TestUseCaseViewsAnonymous(TestCase):
    def test_get_use_cases_view(self):
        # it's "successful" but it better be empty, create a user but don't log in
        u = User.objects.create_user(username='username', password='password')
        UseCase.objects.create(owner=u, nickname='whatever', show=True)
        resp = self.client.get('/api/use_cases/')
        self.assertEqual(resp.status_code, 200)
        self.assertEqual(resp.content, '[]')


class TestGetUseCaseView(TestCase):
    def setUp(self):
        User.objects.create_user(username='username', password='password')
        self.client.login(username='username', password='password')

    def test_view_url_exists_at_desired_location(self):
        resp = self.client.get('/api/use_cases/')
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
