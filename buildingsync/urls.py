from django.conf.urls import url
from .views import index, get_schema


app_name = 'buildingsync'
urlpatterns = [
    url(r'^$', index),
    url(r'^get_schema/$', get_schema, name='get_schema'),
]
