from django.urls import path
from core import views

urlpatterns = [
    #path('', views.index, name='index'),
    #path('login', views.login,include('social_django.urls', namespace='social')),
    path('login', views.login, name='login'),
    path('logout', views.logout_view, name="logout"),
    path('', views.index ),
]

