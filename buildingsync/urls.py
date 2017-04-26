from django.conf.urls import url
from .views import index, get_schema, UseCaseView
from rest_framework_swagger.views import get_swagger_view

schema_view = get_swagger_view(title='BS API')

app_name = 'buildingsync'
urlpatterns = [
    url(r'^$', index, name='index'),
    url(r'^get_schema/$', get_schema, name='get_schema'),
    url(r'^use_cases/$', UseCaseView.as_view(), name='get_use_cases'),
    url(r'^API/$', schema_view),
]
