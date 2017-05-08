from django.http import JsonResponse
from rest_framework import status
from rest_framework import viewsets


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
