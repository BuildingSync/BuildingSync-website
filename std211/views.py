# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import JsonResponse
from django.views.generic import TemplateView
from rest_framework import viewsets

from std211.models import Standard211Instance
from std211.serializers import Std211InstanceSerializer


class IndexView(LoginRequiredMixin, TemplateView):
    template_name = 'std211/index.html'


class Standard211InstanceViews(viewsets.ModelViewSet):
    serializer_class = Std211InstanceSerializer

    def get_queryset(self):
        return Standard211Instance.objects.filter(owner=self.request.user)

    def create(self, request, *args, **kwargs):
        """
        We will override the create method so we can handle the file processing, etc.
        :param request: 
        :param args: 
        :param kwargs: 
        :return: 
        """
        # for now just call this with a request like {'data': 'something'}
        # eventually you would call this with {'spreadsheet_file_contents': 'something'}

        full_data = request.data
        std211_instance = Standard211Instance.objects.create(
            owner=self.request.user,
            data_string=full_data['data']
        )

        std211_instance.save()

        return JsonResponse({'status': 'success'})
