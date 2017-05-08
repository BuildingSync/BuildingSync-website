from django.contrib.auth.models import User
from django.core.urlresolvers import reverse
from django.test import TestCase


class TestIndexViewAnonymous(TestCase):
    def test_index_view(self):
        resp = self.client.get('/')
        self.assertEqual(resp.status_code, 302)
        self.assertRedirects(resp, '/accounts/login/?next=/')


class TestIndexViewLoggedIn(TestCase):
    def setUp(self):
        User.objects.create_user(username='username', password='password')
        self.client.login(username='username', password='password')

    def test_view_url_exists_at_desired_location(self):
        resp = self.client.get('/')
        self.assertEqual(resp.status_code, 200)

    def test_view_url_accessible_by_name(self):
        resp = self.client.get(reverse('buildingsync:index'))
        self.assertEqual(resp.status_code, 200)

    def test_view_uses_correct_template(self):
        resp = self.client.get(reverse('buildingsync:index'))
        self.assertEqual(resp.status_code, 200)
        self.assertTemplateUsed(resp, 'buildingsync/index.html')
