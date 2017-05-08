from django.http import JsonResponse
from rest_framework import decorators
from rest_framework import viewsets

from buildingsync.models import UseCase
from buildingsync.serializers import UseCaseSerializer


class UseCaseViewSet(viewsets.ModelViewSet):
    serializer_class = UseCaseSerializer

    def get_queryset(self):
        if self.request.user.is_authenticated():
            return UseCase.objects.filter(owner=self.request.user)
        else:
            return None  # would prefer to return a 403, but this is OK for now...what about when I POST anonymously?

    @decorators.detail_route(methods=['GET'])
    def export(self, request, pk=None):
        u = UseCase.objects.get(pk=pk)
        serializer = UseCaseSerializer(u)
        data_object = serializer.data
        del data_object['id']
        del data_object['owner']
        all_attributes = u.buildingsyncattribute_set.all()
        attributes = []
        for attr in all_attributes:
            attributes.append({'name': attr.name, 'id': attr.id})
        data_object['attributes'] = attributes
        return JsonResponse(data_object)
