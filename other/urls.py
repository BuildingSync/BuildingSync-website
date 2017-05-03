from django.conf.urls import url
from .views import IndexView, process_object

app_name = 'other'
urlpatterns = [
    url(r'^$', IndexView.as_view(), name='index'),
    url(r'^process_object/$', process_object, name='process_object'),
]
