from django.urls import path
from scrum import views
#from scrum import lib
from scrum import api

urlpatterns = [
    path( 'projecte', views.index, name='projectes' ),
    path( 'projectes', views.index, name='projectes2' ),
    path( 'projecte/<int:id>', views.projecte, name="projecte" ),
    path( 'qualifica', views.qualifica ),

    # api
    path( 'api/crea_qualificacio/<int:sprint_id>/<int:equip_id>', api.crea_qualificacio,
                            name="crea_qualificacio"),

    #path( 'api/actualitza_qualificacions', lib.api_actualitza_qualificacions,
    #                                name="actualitza_qualificacions" ),
    #path( 'api/get_equips', lib.api_get_equips, name="get_equips" ),
    #path( 'api/get_sprints', lib.api_get_sprints, name="get_sprints" ),
]

