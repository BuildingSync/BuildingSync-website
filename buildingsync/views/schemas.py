from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from django.utils.decorators import method_decorator
from rest_framework import decorators
from rest_framework import viewsets

from buildingsync.models import Schema
from buildingsync.serializers import SchemaSerializer
from buildingsync.workers import reset_schema


class SchemaViewSet(viewsets.ModelViewSet):
    queryset = Schema.objects.all()
    serializer_class = SchemaSerializer

    @method_decorator(login_required)
    @decorators.list_route(methods=['GET'])
    def initialize_schema(self, request):
        try:
            s = reset_schema()
            serializer = SchemaSerializer(s)
            s_data = serializer.data
        except Exception as e:  # pragma no cover
            return JsonResponse({'status': 'failure'})
        return JsonResponse({'status': 'success', 'schema': s_data})
