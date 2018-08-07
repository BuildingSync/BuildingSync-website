from django.conf.urls import url, include
from rest_framework import routers

from std211.views import IndexView, Standard211InstanceViews

api_router = routers.SimpleRouter()
api_router.register(r'instances', Standard211InstanceViews, base_name='instances')

app_name = 'std211'
urlpatterns = [
    url(r'^$', IndexView.as_view(), name='index'),
    url(r'api/', include(api_router.urls)),
]
