from django.conf.urls import url, include
from .views import index, get_current_user_id, UseCaseViewSet, SchemaViewSet, BuildingSyncAttributeViewSet
from rest_framework_swagger.views import get_swagger_view
from rest_framework import routers

api_router = routers.SimpleRouter()
api_router.register(r'schemas', SchemaViewSet, base_name='schemas')
api_router.register(r'use_cases', UseCaseViewSet, base_name='use_cases')
api_router.register(r'attributes', BuildingSyncAttributeViewSet, base_name='attributes')

swagger_view = get_swagger_view(title='BuildingSync DownSelection API')

app_name = 'buildingsync'
urlpatterns = [
    url(r'^$', index, name='index'),
    url('^get_current_user_id/', get_current_user_id, name='get_current_user_id'),
    url(r'^swagger/', swagger_view, name='swagger'),
    url(r'api/', include(api_router.urls)),
]
