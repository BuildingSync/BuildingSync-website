# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import JsonResponse
from django.views.generic import TemplateView
from rest_framework import viewsets
from rest_framework.parsers import FormParser, MultiPartParser

from std211.models import Standard211Instance
from std211.serializers import Std211InstanceSerializer


class IndexView(LoginRequiredMixin, TemplateView):
    template_name = 'std211/index.html'


class Standard211InstanceViews(viewsets.ModelViewSet):
    serializer_class = Std211InstanceSerializer
    parser_classes = (FormParser, MultiPartParser,)

    def get_queryset(self):
        return Standard211Instance.objects.filter(owner=self.request.user)

    def create(self, request, *args, **kwargs):
        """
        Override the create method so we can handle the file processing, etc.
        """
        std211_instance = Standard211Instance.objects.create(
            owner=self.request.user,
            filename=request.data['filename'],
            std211_file=request.data['file'],
        )
        # this is a redundant save call
        std211_instance.save()

        return JsonResponse({'status': 'success'})

    def retrieve(self, request, *args, **kwargs):
        # read the excel file and try to convert
        pk = kwargs.get('pk', None)
        if not pk:
            return JsonResponse({'status': 'error', 'message': 'no primary key passed'})

        # get the bsxml version
        std211_instance = Standard211Instance.objects.filter(pk=pk).exists()
        if std211_instance:
            std211_instance = Standard211Instance.objects.get(pk=pk)
            status, data = std211_instance.to_buildingsync()
            if status:
                return JsonResponse(
                    {'status': 'success', 'data': data, 'message': 'none'}
                )
            else:
                return JsonResponse(
                    {'status': 'error', 'message': 'Error converting with {}'.format(data)}
                )
        else:
            return JsonResponse(
                {'status': 'error', 'message': 'could not find Std211 instance'}
            )
