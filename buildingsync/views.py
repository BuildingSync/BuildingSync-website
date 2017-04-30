from django.http import JsonResponse
from django.shortcuts import render
from rest_framework import viewsets
from django.contrib.auth.decorators import login_required
from rest_framework.decorators import detail_route

from .models import UseCase, Schema, BuildingSyncAttribute
from .serializers import UseCaseSerializer, SchemaSerializer, BuildingSyncAttributeSerializer
from django.contrib.auth.models import User


@login_required
def index(request):
    return render(request, 'buildingsync/index.html')


@login_required
def get_current_user_id(request):
    return JsonResponse({'id': request.user.id})


class SchemaViewSet(viewsets.ModelViewSet):
    queryset = Schema.objects.all()
    serializer_class = SchemaSerializer


class UseCaseViewSet(viewsets.ModelViewSet):
    serializer_class = UseCaseSerializer

    def get_queryset(self):
        return UseCase.objects.filter(owner=self.request.user)


class BuildingSyncAttributeViewSet(viewsets.ModelViewSet):
    queryset = BuildingSyncAttribute.objects.all()
    serializer_class = BuildingSyncAttributeSerializer
