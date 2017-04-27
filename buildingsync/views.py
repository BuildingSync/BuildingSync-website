from django.http import JsonResponse
from django.shortcuts import render
from rest_framework.views import APIView

# from buildingsync.management.commands.parsing import get_node
from .models import UseCase, Schema, BuildingSyncAttribute
from .serializers import UseCaseSerializer, SchemaSerializer, BuildingSyncAttributeSerializer


def index(request):
    return render(request, 'buildingsync/index.html')

#
# def get_schema(request):
#     schema_entries = get_node(classname='Site')
#     return JsonResponse({"data": schema_entries})


class SchemaView(APIView):
    """
    List schemas
    """
    def get(self, request, format=None):
        schemas = Schema.objects.all()
        serializer = SchemaSerializer(schemas, many=True)
        return JsonResponse(serializer.data, safe=False)


class UseCaseView(APIView):
    """
    List use cases
    """
    def get(self, request, format=None):
        use_cases = UseCase.objects.all()
        serializer = UseCaseSerializer(use_cases, many=True)
        return JsonResponse(serializer.data, safe=False)


class BuildingSyncAttributeView(APIView):
    """
    List buildingsync attributes
    """
    def get(self, request, format=None):
        attributes = BuildingSyncAttribute.objects.all()
        serializer = BuildingSyncAttributeSerializer(attributes, many=True)
        return JsonResponse(serializer.data, safe=False)
