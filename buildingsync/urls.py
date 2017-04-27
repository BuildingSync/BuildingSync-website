from django.conf.urls import url
from .views import index, UseCaseView, SchemaView, BuildingSyncAttributeView
from rest_framework_swagger.views import get_swagger_view

swagger_view = get_swagger_view(title='BS API')

app_name = 'buildingsync'
urlpatterns = [
    url(r'^$', index, name='index'),
    url(r'^use_cases/$', UseCaseView.as_view(), name='get_use_cases'),
    url(r'^schemas/$', SchemaView.as_view(), name='get_schemas'),
    url(r'^attributes/$', BuildingSyncAttributeView.as_view(), name='get_attributes'),
    url(r'^API/$', swagger_view),
]
