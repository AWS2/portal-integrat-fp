from django.contrib import admin

# Register your models here.

from scrum.models import *

admin.site.register(Projecte)
admin.site.register(Spec)
admin.site.register(Sprint)
admin.site.register(ModulProfessional)
admin.site.register(UnitatFormativa)

