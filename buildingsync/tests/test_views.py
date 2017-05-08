import json

from django.contrib.auth.models import User
from django.core.urlresolvers import reverse
from django.test import TestCase

from buildingsync.models import UseCase


class TestGetCurrentUserIDViewAnonymous(TestCase):
    def test_get_current_use_id_view(self):
        resp = self.client.get('/api/current_user_id/')
        self.assertEqual(resp.status_code, 403)


class TestGetCurrentUserIDView(TestCase):
    def setUp(self):
        self.u = User.objects.create_user(username='username', password='password')
        self.client.login(username='username', password='password')

    def test_view_url_exists_at_desired_location(self):
        resp = self.client.get('/api/current_user_id/')
        self.assertEqual(resp.status_code, 200)

    def test_view_url_accessible_by_name(self):
        resp = self.client.get(reverse('buildingsync:current_user_id-list'))
        self.assertEqual(resp.status_code, 200)

    def test_view_response_is_json(self):
        UseCase.objects.create(nickname="my use case", show=True)
        resp = self.client.get(reverse('buildingsync:current_user_id-list'))
        self.assertEqual(resp.status_code, 200)
        try:
            data = json.loads(resp.content)
            self.assertEqual(data['id'], self.u.id)
        except:  # pragma: no cover
            self.fail('Response from get_use_cases was not proper json')
