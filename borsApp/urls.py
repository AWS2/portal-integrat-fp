from django.urls import path
from . import views

urlpatterns = [
    path( '', views.index, name='index' ),
    path( 'convida', views.convida, name="convida" ),
    path( 'invitacions', views.invitacions, name="invitacions" ),
]

