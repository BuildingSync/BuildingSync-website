from django.http import JsonResponse
from django.shortcuts import render
from rest_framework import viewsets
from rest_framework import status
from django.contrib.auth.decorators import login_required

from .models import UseCase, Schema, BuildingSyncAttribute
from .serializers import UseCaseSerializer, SchemaSerializer, BuildingSyncAttributeSerializer


@login_required
def index(request):
    return render(request, 'buildingsync/index.html')


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


class UseCaseViewSet(viewsets.ModelViewSet):
    serializer_class = UseCaseSerializer

    def get_queryset(self):
        if self.request.user.is_authenticated():
            return UseCase.objects.filter(owner=self.request.user)
        else:
            return None  # would prefer to return a 403, but this is OK for now...what about when I POST anonymously?


class BuildingSyncAttributeViewSet(viewsets.ModelViewSet):
    queryset = BuildingSyncAttribute.objects.all()
    serializer_class = BuildingSyncAttributeSerializer
