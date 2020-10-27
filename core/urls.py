from django.urls import path, include
from core import views

urlpatterns = [
    #path('', views.index, name='index'),
    #path('login', views.login,include('social_django.urls', namespace='social')),
    path('tos', views.tos, name="tos" ),
    path('tos-accepta', views.tos_accepta, name="tos" ),
    path('tos-refusa', views.tos_refusa, name="tos" ),
    # aquest path es on va redirect per defecte quan falla OAuth
    # TODO: explicitar redirect
    path('change_password/',views.change_password, name="change_password"),
    path('login', views.login_view, name='login'),
    path('logout', views.logout_view, name="logout"),
    path('', views.index ),
    path('perfil', views.perfil, name="perfil"),
    # auth framework
    path('accounts/', include('django.contrib.auth.urls')),
]

