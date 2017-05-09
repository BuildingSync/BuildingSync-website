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
        use_case_num = request.data['use_case_num']  # TODO: validate existence, integer
        required = True if request.data['required'] == 'True' else False
        this_attribute = BuildingSyncAttribute.objects.get(pk=pk)
        if required:
            use_case_ids = [str(uc.id) for uc in this_attribute.required_use_cases.all()]
        else:
            use_case_ids = [str(uc.id) for uc in this_attribute.optional_use_cases.all()]
        if any([id_num == str(use_case_num) for id_num in use_case_ids]):
            if required:
                this_attribute.required_use_cases.remove(use_case_num)
            else:
                this_attribute.optional_use_cases.remove(use_case_num)
            return JsonResponse({'status': 'success'})
        else:
            return JsonResponse({'status': 'error'}, status=status.HTTP_400_BAD_REQUEST)

    @decorators.detail_route(methods=['PUT'])
    def add_use_case(self, request, pk):
        use_case_num = request.data['use_case_num']  # TODO: validate existence, integer
        required = True if request.data['required'] == 'True' else False
        this_attribute = BuildingSyncAttribute.objects.get(pk=pk)
        if required:
            use_case_ids = [str(uc.id) for uc in this_attribute.required_use_cases.all()]
        else:
            use_case_ids = [str(uc.id) for uc in this_attribute.optional_use_cases.all()]
        this_use_case = UseCase.objects.get(pk=use_case_num)
        if any([id_num == str(use_case_num) for id_num in use_case_ids]):
            return JsonResponse({'status': 'error'}, status=status.HTTP_400_BAD_REQUEST)
        else:
            if required:
                this_attribute.required_use_cases.add(this_use_case)
            else:
                this_attribute.optional_use_cases.add(this_use_case)
            return JsonResponse({'status': 'success'})
