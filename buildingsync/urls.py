from django.conf.urls import url
from .views import index, get_schema, get_use_cases


app_name = 'buildingsync'
urlpatterns = [
    url(r'^$', index, name='index'),
    url(r'^get_schema/$', get_schema, name='get_schema'),
    url(r'^get_use_cases/$', get_use_cases, name='get_use_cases'),
]
