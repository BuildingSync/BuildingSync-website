from django.http import JsonResponse
from rest_framework import decorators
from rest_framework import status
from rest_framework import viewsets
from rest_framework.mixins import ListModelMixin

from buildingsync.models import UseCase, BuildingSyncAttribute
from buildingsync.serializers import BuildingSyncAttributeSerializer


class BuildingSyncAttributeViewSet(viewsets.ModelViewSet):
    queryset = BuildingSyncAttribute.objects.all()
    serializer_class = BuildingSyncAttributeSerializer

    def list(self, request, *args, **kwargs):
        a = ListModelMixin.list(self, request)
        return a

    @decorators.detail_route(methods=['PUT'])
    def remove_use_case(self, request, pk):
        # First validate and retrieve inputs
        if 'use_case_num' not in request.data:
            return JsonResponse(
                {'status': 'error', 'message': 'Missing use_case_num in request to remove_use_case'},
                status=status.HTTP_400_BAD_REQUEST
            )
        try:
            use_case_num = int(request.data['use_case_num'])
        except ValueError as e:
            return JsonResponse(
                {'status': 'error',
                 'message': 'Bad use_case_num variable in request to remove_use_case, not an integer'},
                status=status.HTTP_400_BAD_REQUEST
            )
        if 'state' not in request.data:
            return JsonResponse(
                {'status': 'error', 'message': 'Missing state variable in request to remove_use_case'},
                status=status.HTTP_400_BAD_REQUEST
            )
        state = str(request.data['state'])
        try:
            this_attribute = BuildingSyncAttribute.objects.get(pk=pk)
        except BuildingSyncAttribute.DoesNotExist:
            return JsonResponse(
                {'status': 'error', 'message': 'Cannot match a buildingsync attribute row with pk=' + str(pk)}
            )
        # Then pick up all the use case IDs that has this attribute and state enabled, and trap for bad state
        if state == 'required':
            use_case_ids = [str(uc.id) for uc in this_attribute.required_use_cases.all()]
        elif state == 'optional':
            use_case_ids = [str(uc.id) for uc in this_attribute.optional_use_cases.all()]
        elif state == 'ignored':
            use_case_ids = [str(uc.id) for uc in this_attribute.ignored_use_cases.all()]
        else:
            return JsonResponse({'status', 'error'}, status=status.HTTP_400_BAD_REQUEST)
        # Then if any of those IDs match the current use case being unchecked, remove that foreign key from the list
        if any([id_num == str(use_case_num) for id_num in use_case_ids]):
            if state == 'required':
                this_attribute.required_use_cases.remove(use_case_num)
            elif state == 'optional':
                this_attribute.optional_use_cases.remove(use_case_num)
            elif state == 'ignored':
                this_attribute.ignored_use_cases.remove(use_case_num)
            return JsonResponse({'status': 'success'})
        else:
            return JsonResponse(
                {'status': 'error',
                 'message': 'Called remove_use_case with a state and use case ID combination that does not exist.'},
                status=status.HTTP_409_CONFLICT
            )

    @decorators.detail_route(methods=['PUT'])
    def add_use_case(self, request, pk):
        # First validate and retrieve inputs
        if 'use_case_num' not in request.data:
            return JsonResponse(
                {'status': 'error', 'message': 'Missing use_case_num in request to add_use_case'},
                status=status.HTTP_400_BAD_REQUEST
            )
        try:
            use_case_num = int(request.data['use_case_num'])
        except ValueError as e:
            return JsonResponse(
                {'status': 'error',
                 'message': 'Bad use_case_num variable in request to add_use_case, not an integer'},
                status=status.HTTP_400_BAD_REQUEST
            )
        if 'state' not in request.data:
            return JsonResponse(
                {'status': 'error', 'message': 'Missing state variable in request to add_use_case'},
                status=status.HTTP_400_BAD_REQUEST
            )
        state = str(request.data['state'])
        try:
            this_attribute = BuildingSyncAttribute.objects.get(pk=pk)
        except BuildingSyncAttribute.DoesNotExist:
            return JsonResponse(
                {'status': 'error', 'message': 'Cannot match a buildingsync attribute row with pk=' + str(pk)}
            )
        # Then pick up all the use case IDs that has this attribute and state enabled, and trap for bad state
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
            return JsonResponse(
                {'status': 'success',
                 'message': 'Called add_use_case with a state and use case ID combination that already exists.'},
                status=status.HTTP_200_OK
            )
        else:
            if state == 'required':
                this_attribute.required_use_cases.add(this_use_case)
            elif state == 'optional':
                this_attribute.optional_use_cases.add(this_use_case)
            elif state == 'ignored':
                this_attribute.ignored_use_cases.add(this_use_case)
            return JsonResponse({'status': 'success'})
