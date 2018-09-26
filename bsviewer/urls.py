from django.urls import path, re_path
from bsviewer import views

app_name = 'bsviewer'
urlpatterns = [
    path('', views.index, name='index'),
    path('use_cases', views.use_cases, name='cases'),
    path('use_case/create/', views.UseCaseCreate.as_view(), name='use_case_create'),
    path('use_case/<int:pk>/update/', views.UseCaseUpdate.as_view(), name='use_case_update'),
    path('use_case/<int:pk>/delete/', views.UseCaseDelete.as_view(), name='use_case_delete'),
    re_path('download_template/(?P<name>\S+)/', views.download_template, name='download_template'),
    path('validator', views.validator, name='validator'),
    path('dictionary', views.redirect_data_dictionary, name='dictionary'),
    re_path(r'^dictionary/(?P<version>\w+.\w+)/$', views.dictionary, name='dictionaryversion')

]
