from django.urls import path
from . import views

urlpatterns = [
    path( 'projecte', views.index, name='projectes' ),
    path( 'projecte/<int:id>', views.projecte, name="projecte" ),
]

