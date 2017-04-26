from django.http import JsonResponse
from django.shortcuts import render

from .parsing import get_node


def index(request):
    return render(request, 'buildingsync/base.html')


def get_schema(request):
    schema_entries = get_node(classname='Site')  # ''SiteType')
    return JsonResponse({"data": schema_entries})
