from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import JsonResponse
from django.utils.decorators import method_decorator
from django.views.generic import TemplateView
from rest_framework import decorators
from rest_framework import status
from rest_framework import viewsets

from buildingsync.workers import reset_schema
from .models import UseCase, Schema, BuildingSyncAttribute
from .serializers import UseCaseSerializer, SchemaSerializer, BuildingSyncAttributeSerializer


class IndexView(LoginRequiredMixin, TemplateView):
    template_name = 'buildingsync/index.html'


class CurrentUserViewSet(viewsets.ViewSet):
    """
    Get current user information
    """

    def list(self, request):
        if request.user.is_authenticated():
            return JsonResponse({'id': request.user.id})
        else:
            return JsonResponse({'status': 'anonymous user called get_current_user_id'},
                                status=status.HTTP_403_FORBIDDEN)


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
        except Exception:  # pragma no cover
            return JsonResponse({'status': 'failure'})
        return JsonResponse({'status': 'success', 'schema': s_data})


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


class BuildingSyncAttributeViewSet(viewsets.ModelViewSet):
    queryset = BuildingSyncAttribute.objects.all()
    serializer_class = BuildingSyncAttributeSerializer

    @decorators.detail_route(methods=['PUT'])
    def remove_use_case(self, request, pk):
        use_case_num = request.data['use_case_num']
        this_attribute = BuildingSyncAttribute.objects.get(pk=pk)
        if any([str(uc.id) == use_case_num for uc in this_attribute.use_cases.all()]):
            this_attribute.use_cases.remove(use_case_num)
            return JsonResponse({'status': 'success'})
        else:
            return JsonResponse({'status': 'error'}, status=status.HTTP_400_BAD_REQUEST)

    @decorators.detail_route(methods=['PUT'])
    def add_use_case(self, request, pk):
        use_case_num = request.data['use_case_num']
        this_attribute = BuildingSyncAttribute.objects.get(pk=pk)
        this_use_case = UseCase.objects.get(pk=use_case_num)
        if any([str(uc.id) == use_case_num for uc in this_attribute.use_cases.all()]):
            return JsonResponse({'status': 'error'}, status=status.HTTP_400_BAD_REQUEST)
        else:
            this_attribute.use_cases.add(this_use_case)
            return JsonResponse({'status': 'success'})
