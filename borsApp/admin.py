from django.contrib import admin

# Register your models here.


from borsApp.models import *


class CatAdmin(admin.ModelAdmin):
	model = Categoria
	list_display = ('nom','pare','descripcio')
	search_fields = ('nom','pare__nom')
	ordering = ('pare','nom',)

class CicleAdmin(admin.ModelAdmin):
	list_display = ('nom','familia')
	ordering = ('familia','nom',)

admin.site.register( Categoria, CatAdmin )
admin.site.register( Cicle, CicleAdmin )

