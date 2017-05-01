from django.core.urlresolvers import reverse
from django.test import TestCase
import json
from buildingsync.models import UseCase
from django.contrib.auth.models import User


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
        except:  # pragma: no cover
            self.fail('Response from get_schema was not proper json')


class TestAttributesViewsAnonymous(TestCase):

    def test_get_attributes_view(self):
        resp = self.client.get('/api/attributes/')
        self.assertEqual(resp.status_code, 200)


class TestAttributesView(TestCase):

    def setUp(self):
        User.objects.create_user(username='username', password='password')
        self.client.login(username='username', password='password')

    def test_view_url_exists_at_desired_location(self):
        resp = self.client.get('/api/attributes/')
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
        data = ""
        try:
            data = json.loads(resp.content)
        except:  # pragma: no cover
            self.fail('Response from get_use_cases was not proper json')
        self.assertEqual(data['id'], self.u.id)
