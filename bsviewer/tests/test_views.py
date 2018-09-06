from django.test import TestCase
from django.urls import reverse


class BsviewerIndexViewTests(TestCase):
    def test_ok(self):
        response = self.client.get(reverse('bsviewer:index'))
        self.assertEqual(response.status_code, 200)
