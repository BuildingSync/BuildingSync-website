import json
from urllib import urlencode

from django.contrib.auth.models import User
from django.core.urlresolvers import reverse
from django.test import TestCase

from buildingsync.models import BuildingSyncAttribute, Schema, UseCase


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
        except BaseException:  # pragma: no cover
            self.fail('Response from get_attributes was not proper json')


class TestAddRemoveUseCaseToAttribute(TestCase):
    def setUp(self):
        self.u = User.objects.create_user(username='han', password='solo')
        self.use_case_a = UseCase.objects.create(owner=self.u, nickname="Millennium Falcon", show=True)
        self.use_case_b = UseCase.objects.create(owner=self.u, nickname="X-Wing", show=True)
        self.obj_a_req = urlencode({'use_case_num': self.use_case_a.pk, 'required': True})
        self.obj_b_req = urlencode({'use_case_num': self.use_case_b.pk, 'required': True})
        self.obj_a_opt = urlencode({'use_case_num': self.use_case_a.pk, 'required': False})
        self.obj_b_opt = urlencode({'use_case_num': self.use_case_b.pk, 'required': False})
        self.schema = Schema.objects.create(
            name="TestSchema", version=2
        )
        self.attribute = BuildingSyncAttribute.objects.create(
            name="Empty", schema=self.schema, tree_level=1, index=1
        )
        self.attribute.save()
        self.add_path = '/api/attributes/%s/add_use_case/'
        self.remove_path = '/api/attributes/%s/remove_use_case/'

    def test_required(self):
        # verify the initial state
        self.assertEqual(0, len(self.attribute.required_use_cases.all()))
        # fail to remove one, the state is empty anyway
        response = self.client.put(self.remove_path % self.attribute.pk, self.obj_a_req,
                                   content_type='application/x-www-form-urlencoded')
        self.assertEqual(400, response.status_code)
        self.assertEqual(0, len(self.attribute.required_use_cases.all()))
        # successfully add one
        response = self.client.put(self.add_path % self.attribute.pk, self.obj_a_req,
                                   content_type='application/x-www-form-urlencoded')
        self.assertEqual(200, response.status_code)
        self.assertEqual(1, len(self.attribute.required_use_cases.all()))
        # fail to remove a different one
        response = self.client.put(self.remove_path % self.attribute.pk, self.obj_b_req,
                                   content_type='application/x-www-form-urlencoded')
        self.assertEqual(400, response.status_code)
        self.assertEqual(1, len(self.attribute.required_use_cases.all()))
        # successfully add a second one
        response = self.client.put(self.add_path % self.attribute.pk, self.obj_b_req,
                                   content_type='application/x-www-form-urlencoded')
        self.assertEqual(200, response.status_code)
        self.assertEqual(2, len(self.attribute.required_use_cases.all()))
        # what about adding a duplicate...it fails as I'd expect
        response = self.client.put(self.add_path % self.attribute.pk, self.obj_b_req,
                                   content_type='application/x-www-form-urlencoded')
        self.assertEqual(400, response.status_code)
        self.assertEqual(2, len(self.attribute.required_use_cases.all()))
        # successfully remove one
        response = self.client.put(self.remove_path % self.attribute.pk, self.obj_b_req,
                                   content_type='application/x-www-form-urlencoded')
        self.assertEqual(200, response.status_code)
        self.assertEqual(1, len(self.attribute.required_use_cases.all()))

    def test_optional(self):
        # verify the initial state
        self.assertEqual(0, len(self.attribute.optional_use_cases.all()))
        # fail to remove one, the state is empty anyway
        response = self.client.put(self.remove_path % self.attribute.pk, self.obj_a_opt,
                                   content_type='application/x-www-form-urlencoded')
        self.assertEqual(400, response.status_code)
        self.assertEqual(0, len(self.attribute.optional_use_cases.all()))
        # successfully add one
        response = self.client.put(self.add_path % self.attribute.pk, self.obj_a_opt,
                                   content_type='application/x-www-form-urlencoded')
        self.assertEqual(200, response.status_code)
        self.assertEqual(1, len(self.attribute.optional_use_cases.all()))
        # fail to remove a different one
        response = self.client.put(self.remove_path % self.attribute.pk, self.obj_b_opt,
                                   content_type='application/x-www-form-urlencoded')
        self.assertEqual(400, response.status_code)
        self.assertEqual(1, len(self.attribute.optional_use_cases.all()))
        # successfully add a second one
        response = self.client.put(self.add_path % self.attribute.pk, self.obj_b_opt,
                                   content_type='application/x-www-form-urlencoded')
        self.assertEqual(200, response.status_code)
        self.assertEqual(2, len(self.attribute.optional_use_cases.all()))
        # what about adding a duplicate...it fails as I'd expect
        response = self.client.put(self.add_path % self.attribute.pk, self.obj_b_opt,
                                   content_type='application/x-www-form-urlencoded')
        self.assertEqual(400, response.status_code)
        self.assertEqual(2, len(self.attribute.optional_use_cases.all()))
        # successfully remove one
        response = self.client.put(self.remove_path % self.attribute.pk, self.obj_b_opt,
                                   content_type='application/x-www-form-urlencoded')
        self.assertEqual(200, response.status_code)
        self.assertEqual(1, len(self.attribute.optional_use_cases.all()))
