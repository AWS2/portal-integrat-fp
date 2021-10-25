from django.urls import path
from scrum import views
from scrum import lib

urlpatterns = [
    path( 'projecte', views.index, name='projectes' ),
    path( 'projectes', views.index, name='projectes2' ),
    path( 'projecte/<int:id>', views.projecte, name="projecte" ),
    path( 'qualifica', views.qualifica ),

    # api
    path( 'api/actualitza_qualificacions', lib.api_actualitza_qualificacions,
                                    name="actualitza_qualificacions" ),
    path( 'api/get_equips', lib.api_get_equips, name="get_equips" ),
]

