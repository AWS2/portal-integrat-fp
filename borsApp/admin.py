from django.contrib import admin

# Register your models here.


from borsApp.models import *


class CatAdmin(admin.ModelAdmin):
	model = Categoria
	list_display = ('nom','pare','descripcio')
	search_fields = ('nom','pare__nom')


admin.site.register( Categoria, CatAdmin )
admin.site.register( Cicle )
