from django.contrib import admin

# Register your models here.


from borsApp.models import *


class CatAdmin(admin.ModelAdmin):
	model = Categoria
	list_display = ('nom','pare')

admin.site.register( Categoria, CatAdmin )

