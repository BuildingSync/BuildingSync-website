from django.urls import path
from bsviewer import views

app_name = 'bsviewer'
urlpatterns = [
    path('', views.index, name='index'),
    path('use_cases', views.use_cases, name='cases'),
    path('use_case/create/', views.UseCaseCreate.as_view(), name='use_case_create'),
    path('use_case/<int:pk>/update/', views.UseCaseUpdate.as_view(), name='use_case_update'),
    path('use_case/<int:pk>/delete/', views.UseCaseDelete.as_view(), name='use_case_delete'),
]
