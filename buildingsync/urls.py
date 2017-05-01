from django.conf.urls import url, include
from .views import IndexView, CurrentUserViewSet, UseCaseViewSet, SchemaViewSet, BuildingSyncAttributeViewSet
from rest_framework_swagger.views import get_swagger_view
from rest_framework import routers

api_router = routers.SimpleRouter()
api_router.register(r'schemas', SchemaViewSet, base_name='schemas')
api_router.register(r'use_cases', UseCaseViewSet, base_name='use_cases')
api_router.register(r'attributes', BuildingSyncAttributeViewSet, base_name='attributes')
api_router.register(r'current_user_id', CurrentUserViewSet, base_name='current_user_id')


swagger_view = get_swagger_view(title='BuildingSync DownSelection API')

app_name = 'buildingsync'
urlpatterns = [
    url(r'^$', IndexView.as_view(), name='index'),
    url(r'^swagger/', swagger_view, name='swagger'),
    url(r'api/', include(api_router.urls)),
]
