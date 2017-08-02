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
        state = str(request.data['state'])
        this_attribute = BuildingSyncAttribute.objects.get(pk=pk)
        if state == 'required':
            use_case_ids = [str(uc.id) for uc in this_attribute.required_use_cases.all()]
        elif state == 'optional':
            use_case_ids = [str(uc.id) for uc in this_attribute.optional_use_cases.all()]
        elif state == 'ignored':
            use_case_ids = [str(uc.id) for uc in this_attribute.ignored_use_cases.all()]
        else:
            return JsonResponse({'status', 'error'}, status=status.HTTP_400_BAD_REQUEST)
        if any([id_num == str(use_case_num) for id_num in use_case_ids]):
            if state == 'required':
                this_attribute.required_use_cases.remove(use_case_num)
            elif state == 'optional':
                this_attribute.optional_use_cases.remove(use_case_num)
            elif state == 'ignored':
                this_attribute.ignored_use_cases.remove(use_case_num)
            return JsonResponse({'status': 'success'})
        else:
            return JsonResponse({'status': 'error'}, status=status.HTTP_400_BAD_REQUEST)

    @decorators.detail_route(methods=['PUT'])
    def add_use_case(self, request, pk):
        use_case_num = request.data['use_case_num']  # TODO: validate existence, integer
        state = str(request.data['state'])
        this_attribute = BuildingSyncAttribute.objects.get(pk=pk)
        if state == 'required':
            use_case_ids = [str(uc.id) for uc in this_attribute.required_use_cases.all()]
        elif state == 'optional':
            use_case_ids = [str(uc.id) for uc in this_attribute.optional_use_cases.all()]
        elif state == 'ignored':
            use_case_ids = [str(uc.id) for uc in this_attribute.ignored_use_cases.all()]
        else:
            return JsonResponse({'status', 'error'}, status=status.HTTP_400_BAD_REQUEST)
        this_use_case = UseCase.objects.get(pk=use_case_num)
        if str(use_case_num) in use_case_ids:
            return JsonResponse({'status': 'error'}, status=status.HTTP_400_BAD_REQUEST)
        else:
            if state == 'required':
                this_attribute.required_use_cases.add(this_use_case)
            elif state == 'optional':
                this_attribute.optional_use_cases.add(this_use_case)
            elif state == 'ignored':
                this_attribute.ignored_use_cases.add(this_use_case)
            return JsonResponse({'status': 'success'})
