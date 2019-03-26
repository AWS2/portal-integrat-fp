from django.contrib import admin
from django.contrib.auth.admin import UserAdmin


# Register your models here.


from borsApp.models import *


class CatAdmin(admin.ModelAdmin):
	model = Categoria
	list_display = ('nom','pare','descripcio')
	search_fields = ('nom','pare__nom')

class MyUserAdmin(UserAdmin):
	fieldsets = UserAdmin.fieldsets + (
            (None, {
				'fields': ('imatge','arxiu',),
				#'readonly_fields': ('imatge_avatar',)
			}),
    )
	#readonly_fields = ['imatge_avatar',]
	def imatge_avatar(self, obj):
		return mark_safe('<img src="{url}" width="{width}" height={height} />'.format(
            url = obj.imatge.url,
            width=obj.imatge.width,
            height=obj.imatge.height,
            )
		)

admin.site.register( Categoria, CatAdmin )
admin.site.register( Cicle )
admin.site.register( User, MyUserAdmin)
