from django.contrib.auth import views as auth_views
from django.urls import path, re_path, include

from bsviewer import views
from bsviewer.admin import admin_site
from rest_framework import routers

app_name = 'bsviewer'

router = routers.DefaultRouter()

urlpatterns = [
    path('', views.index, name='index'),
    path('', views.index, name='home'),
    path('admin/', admin_site.urls, name='admin'),
    path('user/login/', auth_views.LoginView.as_view(template_name='registration/login.html'),
         name='login'),
    path('user/profile/', views.profile, name='profile'),
    path('user/logout/', auth_views.LogoutView.as_view(next_page='login'), name='logout'),
    path('user/updateuser/', views.update_user, name='updateuser'),
    path('user/password_change/', views.change_password, name='change_password'),
    path('use_cases', views.use_cases, name='cases'),
    path('use_case/create/', views.UseCaseCreate.as_view(), name='use_case_create'),
    path('use_case/<int:pk>/update/', views.UseCaseUpdate.as_view(), name='use_case_update'),
    path('use_case/<int:pk>/delete/', views.UseCaseDelete.as_view(), name='use_case_delete'),
    re_path('download_template/(?P<id>\S+)/$', views.download_template, name='download_template'),
    path('validator', views.validator, name='validator'),
    path('dictionary', views.redirect_data_dictionary, name='dictionary'),
    re_path(r'^dictionary/(?P<version>\w+.\w+.\w+)/$', views.dictionary, name='dictionaryversion'),
    re_path(r'^ajax/enum/$', views.retrieve_additional_dictionary_data, name='get_additional_data'),
    re_path(r'^api/', include(router.urls)),
    re_path(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    re_path(r'^api/validate', views.ValidatorApi.as_view())
]
