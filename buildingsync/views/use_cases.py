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

    @decorators.list_route(methods=['POST'], url_path="import")
    def import_use_case(self, request):
        u = UseCase.objects.create(owner=request.user, nickname=request.data['nickname'], show=request.data['show'])
        all_attributes = request.data['attributes']
        required_attributes = all_attributes['required']
        for req_attr in required_attributes:
            u.required_use_cases.add(req_attr['id'])
        optional_attributes = all_attributes['optional']
        for opt_attr in optional_attributes:
            u.optional_use_cases.add(opt_attr['id'])
        ignored_attributes = all_attributes['ignored']
        for ignored_attr in ignored_attributes:
            u.ignored_use_cases.add(ignored_attr['id'])
        u.save()
        serializer = UseCaseSerializer(u)
        return JsonResponse(serializer.data)

    @decorators.detail_route(methods=['GET'])
    def export(self, request, pk=None):
        u = UseCase.objects.get(pk=pk)  # TODO: Validate for this user
        serializer = UseCaseSerializer(u)
        data_object = serializer.data
        del data_object['id']
        del data_object['owner']
        required_attributes = u.required_use_cases.all()
        required_attributes_for_export = []
        for attr in required_attributes:
            required_attributes_for_export.append({'name': attr.name, 'id': attr.id})
        optional_attributes = u.optional_use_cases.all()
        optional_attributes_for_export = []
        for attr in optional_attributes:
            optional_attributes_for_export.append({'name': attr.name, 'id': attr.id})
        ignored_attributes = u.optional_use_cases.all()
        ignored_attributes_for_export = []
        for attr in ignored_attributes:
            ignored_attributes_for_export.append({'name': attr.name, 'id': attr.id})

        data_object['attributes'] = {'required': required_attributes_for_export,
                                     'optional': optional_attributes_for_export,
                                     'ignored': ignored_attributes_for_export}
        return JsonResponse(data_object)
