from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth import views as auth_views
from django.urls import include, path, re_path
from rest_framework import routers

from bsyncviewer import views
from bsyncviewer.admin import admin_site

from .views import emailView, successView

app_name = 'bsyncviewer'

router = routers.DefaultRouter()


urlpatterns = [
    path('', views.index, name='index'),
    path('', views.index, name='home'),
    path('email/', emailView, name='email'),
    path('success/', successView, name='success'),
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
    re_path('download_examples', views.download_examples, name='download_examples'),
    re_path('download_usecase_example', views.download_usecase_example, name='download_usecase_example'),
    re_path('download_usecase_file/(?P<pk>[0-9]+)/$', views.download_usecase_file, name='download_usecase_file'),
    path('validator', views.validator, name='validator'),
    path('dictionary', views.redirect_data_dictionary, name='dictionary'),
    path('mlod', views.mlod, name='mlod'),
    path('case_study', views.case_study, name="case_study"),
    path('about', views.about, name='about'),
    path('about/current_adopters', views.adopters, name='adopters'),
    path('about/collaborators', views.collaborators, name='collaborators'),
    path('faq', views.faq, name='faq'),
    path('implementers', views.implementers, name='implementers'),
    path('auditors', views.auditors, name='auditors'),
    path('practitioners', views.practitioners, name='practitioners'),
    path('tools', views.tools, name='tools'),
    path('schema', views.releases, name='releases'),
    path('releases', views.releases, name='releases'),
    path('documents', views.references, name='references'),
    path('references', views.references, name='references'),
    path('contact', views.contact, name='contact'),
    path('onboarding', views.onboarding, name='onboarding'),
    path('technical_resources', views.technical_resources, name='technical_resources'),
    re_path(r'^dictionary/(?P<version>[0-9a-zA-Z_\.-]+)/$', views.dictionary, name='dictionaryversion'),
    re_path(r'^ajax/enum/$', views.retrieve_additional_dictionary_data, name='get_additional_data'),
    re_path(r'^enumerations/(?P<version>[0-9a-zA-Z_\.-]+)/$', views.enumerations, name='enumerations'),
    re_path(r'^measures/(?P<version>[0-9a-zA-Z_\.-]+)/$', views.measures, name='measures'),
    re_path(r'^api/', include(router.urls)),
    re_path(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    re_path(r'^api/validate', views.ValidatorApi.as_view(), name='validate_api')
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
    # documentation files are technically in media, but we provide this url
    # for a prettier path. Would normally be handled by nginx alias in production
    urlpatterns += [re_path(
        r'^documentation/(?P<version>[0-9a-zA-Z_\.-]+)/$',
        views.documentation
    )]
