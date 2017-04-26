from django.http import JsonResponse
from django.shortcuts import render

from .models import UseCase
from .parsing import get_node


def index(request):
    return render(request, 'buildingsync/index.html')


def get_schema(request):
    schema_entries = get_node(classname='Site')
    return JsonResponse({"data": schema_entries})


def get_use_cases(request):
    all_use_cases = []
    for uc in UseCase.objects.all():
        all_use_cases.append({'id': uc.pk, 'nickname': uc.nickname, 'show': uc.show})
    return JsonResponse({"data": all_use_cases})
