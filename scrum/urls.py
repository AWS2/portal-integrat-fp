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
    path( 'api/crea_qualificacio/<int:sprint_id>/<int:equip_id>',
                    api.crea_qualificacio,name="crea_qualificacio"),
    path( 'api/get_done_specs/<int:qualificacio_id>',
                    api.get_done_specs,name="get_done_specs"),
    path( 'api/toggle_done_spec/<int:done_spec_id>',
                    api.toggle_done_spec,name="toggle_done_spec"),

]

