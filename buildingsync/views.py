import tempfile, os
from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import JsonResponse, HttpResponse
from django.views.generic import TemplateView
from rest_framework import status
from rest_framework import viewsets
from rest_framework.decorators import detail_route, list_route

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


class UseCaseViewSet(viewsets.ModelViewSet):
    serializer_class = UseCaseSerializer

    def get_queryset(self):
        if self.request.user.is_authenticated():
            return UseCase.objects.filter(owner=self.request.user)
        else:
            return None  # would prefer to return a 403, but this is OK for now...what about when I POST anonymously?

    @detail_route(methods=['GET'])
    def export(self, request, pk):
        # retrieve it if it exists and belongs to this user
        try:
            uc = UseCase.objects.filter(pk=pk, owner=self.request.user)
        except:
            return None
        return JsonResponse({'hello': 'world'})

    @list_route(methods=['GET'])
    def send_file(self, request):
        """
        Send a file through Django without loading the whole file into
        memory at once. The FileWrapper will turn the file object into an
        iterator for chunks of 8KB.
        """
        filename = '/tmp/test' # Select your file here.
        response = HttpResponse(file(filename), content_type='text/plain')
        response['Content-Length'] = os.path.getsize(filename)
        return response


class BuildingSyncAttributeViewSet(viewsets.ModelViewSet):
    queryset = BuildingSyncAttribute.objects.all()
    serializer_class = BuildingSyncAttributeSerializer
