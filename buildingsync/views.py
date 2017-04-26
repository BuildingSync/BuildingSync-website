from django.http import JsonResponse
from django.shortcuts import render
from rest_framework.views import APIView

from .models import UseCase
from .parsing import get_node
from .serializers import UseCaseSerializer


def index(request):
    return render(request, 'buildingsync/index.html')


def get_schema(request):
    schema_entries = get_node(classname='Site')
    return JsonResponse({"data": schema_entries})


class UseCaseView(APIView):
    """
    List use cases
    """
    def get(self, request, format=None):
        use_cases = UseCase.objects.all()
        serializer = UseCaseSerializer(use_cases, many=True)
        return JsonResponse(serializer.data, safe=False)
