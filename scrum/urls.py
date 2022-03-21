from django.urls import path
from scrum import views
#from scrum import lib
from scrum import api

urlpatterns = [
    path( 'projecte', views.index, name='projectes' ),
    path( 'projectes', views.index, name='projectes2' ),
    path( 'projecte/<int:id>', views.projecte, name="projecte" ),
    path( 'qualifica', views.qualifica, name="qualifica" ),
    path( 'descarrega_qualificacions/<int:projecte_id>', views.descarrega_qualificacions,
                name="descarrega_qualificacions" ),

    # api
    path( 'api/crea_qualificacio/<int:sprint_id>/<int:equip_id>',
                    api.crea_qualificacio,name="crea_qualificacio"),
    path( 'api/elimina_qualificacio/<int:qualificacio_id>',
                    api.elimina_qualificacio,name="elimina_qualificacio"),
    path( 'api/get_done_specs/<int:qualificacio_id>',
                    api.get_done_specs,name="get_done_specs"),
    path( 'api/get_qualificacio/<int:qualificacio_id>',
                    api.get_qualificacio,name="get_qualificacio"),
    path( 'api/toggle_done_spec/<int:done_spec_id>',
                    api.toggle_done_spec,name="toggle_done_spec"),
    path( 'api/change_done_spec/<int:done_spec_id>/<int:value>',
                    api.change_done_spec,name="change_done_spec"),

]

