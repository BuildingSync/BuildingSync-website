from django.shortcuts import render
from rest_framework import viewsets

from .models import UseCase, Schema, BuildingSyncAttribute
from .serializers import UseCaseSerializer, SchemaSerializer, BuildingSyncAttributeSerializer


def index(request):
    return render(request, 'buildingsync/index.html')


class SchemaViewSet(viewsets.ModelViewSet):
    queryset = Schema.objects.all()
    serializer_class = SchemaSerializer


class UseCaseViewSet(viewsets.ModelViewSet):
    queryset = UseCase.objects.all()
    serializer_class = UseCaseSerializer


class BuildingSyncAttributeViewSet(viewsets.ModelViewSet):
    queryset = BuildingSyncAttribute.objects.all()
    serializer_class = BuildingSyncAttributeSerializer
