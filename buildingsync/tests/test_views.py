import json
from urllib import urlencode

from django.contrib.auth.models import User
from django.core.urlresolvers import reverse
from django.test import TestCase

from buildingsync.models import UseCase, BuildingSyncAttribute, Schema


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
        try:
            data = json.loads(resp.content)
            self.assertEqual(data['id'], self.u.id)
        except:  # pragma: no cover
            self.fail('Response from get_use_cases was not proper json')


class TestAddRemoveUseCaseToAttribute(TestCase):
    def setUp(self):
        self.u = User.objects.create_user(username='han', password='solo')
        self.use_case_a = UseCase.objects.create(owner=self.u, nickname="Millennium Falcon", show=True)
        self.use_case_b = UseCase.objects.create(owner=self.u, nickname="X-Wing", show=True)
        self.obj_a = urlencode({'use_case_num': self.use_case_a.pk})
        self.obj_b = urlencode({'use_case_num': self.use_case_b.pk})
        self.schema = Schema.objects.create(
            name="TestSchema", version=2
        )
        self.attribute = BuildingSyncAttribute.objects.create(
            name="Empty", schema=self.schema, tree_level=1, index=1
        )
        self.attribute.save()
        self.add_path = '/api/attributes/%s/add_use_case/'
        self.remove_path = '/api/attributes/%s/remove_use_case/'

    def test_adding_and_removing(self):
        # verify the initial state
        self.assertEqual(0, len(self.attribute.use_cases.all()))
        # fail to remove one, the state is empty anyway
        response = self.client.put(self.remove_path % self.attribute.pk, self.obj_a,
                                   content_type='application/x-www-form-urlencoded')
        self.assertEqual(400, response.status_code)
        self.assertEqual(0, len(self.attribute.use_cases.all()))
        # successfully add one
        response = self.client.put(self.add_path % self.attribute.pk, self.obj_a,
                                   content_type='application/x-www-form-urlencoded')
        self.assertEqual(200, response.status_code)
        self.assertEqual(1, len(self.attribute.use_cases.all()))
        # fail to remove a different one
        response = self.client.put(self.remove_path % self.attribute.pk, self.obj_b,
                                   content_type='application/x-www-form-urlencoded')
        self.assertEqual(400, response.status_code)
        self.assertEqual(1, len(self.attribute.use_cases.all()))
        # successfully add a second one
        response = self.client.put(self.add_path % self.attribute.pk, self.obj_b,
                                   content_type='application/x-www-form-urlencoded')
        self.assertEqual(200, response.status_code)
        self.assertEqual(2, len(self.attribute.use_cases.all()))
        # what about adding a duplicate...it fails as I'd expect
        response = self.client.put(self.add_path % self.attribute.pk, self.obj_b,
                                   content_type='application/x-www-form-urlencoded')
        self.assertEqual(400, response.status_code)
        self.assertEqual(2, len(self.attribute.use_cases.all()))
        # successfully remove one
        response = self.client.put(self.remove_path % self.attribute.pk, self.obj_b,
                                   content_type='application/x-www-form-urlencoded')
        self.assertEqual(200, response.status_code)
        self.assertEqual(1, len(self.attribute.use_cases.all()))
