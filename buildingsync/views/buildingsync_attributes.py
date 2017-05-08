from django.http import JsonResponse
from rest_framework import decorators
from rest_framework import status
from rest_framework import viewsets

from buildingsync.models import UseCase, BuildingSyncAttribute
from buildingsync.serializers import BuildingSyncAttributeSerializer


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
