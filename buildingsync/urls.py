from django.conf.urls import url
from .views import index, UseCaseViewSet, SchemaViewSet, BuildingSyncAttributeViewSet
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
    url(r'^swagger/$', swagger_view, name='swagger'),
] + api_router.urls
