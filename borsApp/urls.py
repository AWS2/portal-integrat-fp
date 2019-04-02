from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    #path('login', views.login,include('social_django.urls', namespace='social')),
    path('login', views.login, name='login'),
]