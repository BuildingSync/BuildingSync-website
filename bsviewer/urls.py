from django.urls import path

from bsviewer import views

app_name = 'bsviewer'
urlpatterns = [
    path('', views.index, name='index'),
]