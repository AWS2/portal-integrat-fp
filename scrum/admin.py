from django.contrib import admin
from django import forms

from django.utils.safestring import mark_safe
from easy_select2 import select2_modelform
from adminsortable2.admin import SortableAdminMixin
from adminsortable2.admin import SortableInlineAdminMixin

# Register your models here.

from scrum.models import *

ProjecteForm = select2_modelform(Projecte)
SprintForm = select2_modelform(Sprint)
EquipForm = select2_modelform(Equip)
SpecForm = select2_modelform(Spec)

class EquipAdmin(admin.ModelAdmin):
	model = Equip
	filter_horizontal = ('membres',)
	list_display = ('nom','projecte','centre','show_membres',)
	#form = EquipForm
	def centre(self,obj):
		return obj.projecte.centre.nom
	def cicle(self,obj):
		return obj.projecte.cicle.nom
	def show_membres(self,obj):
		ret = ""
		for membre in obj.membres.all():
			ret += membre.first_name + " " + membre.last_name \
				+ " (<a href='/admin/core/user/"+str(membre.id)+"'>" + membre.username+"</a>)<br>\n"
		return mark_safe(ret)

class SpecInline(SortableInlineAdminMixin,admin.TabularInline):
	model = Spec
	form = SpecForm
	exclude = ('descripcio','pare')
	extra = 0
	# restrict mps al cicle
	def formfield_for_manytomany(self, db_field, request=None, **kwargs):
		if db_field.name == 'mp':
			try:
				parts = request.get_raw_uri().split("/")
				i = parts.index("projecte")
				#print("I="+str(i))
				obj_id = parts[i+1]
				#print(obj_id)
				# obj és un projecte
				obj = Projecte.objects.get(pk=obj_id)
				#print(obj.id)
				if obj:
					kwargs['queryset'] = ModulProfessional.objects.filter(cicle=obj.cicle).order_by('numero')
				else:
					kwargs['queryset'] = ModulProfessional.objects.none()
			except:
				print("ERROR in formfield_for_manytomany (SpecInline)")
		return super().formfield_for_manytomany(db_field, request=request, **kwargs)
class SprintInline(admin.TabularInline):
	model = Sprint
	form = SprintForm
	ordering = ('inici',)
	exclude = ('notes',)
	extra = 0
	# restrict specs al proj
	def formfield_for_manytomany(self, db_field, request=None, **kwargs):
		if db_field.name == 'specs':
			try:
				parts = request.get_raw_uri().split("/")
				i = parts.index("projecte")
				#print("I="+str(i))
				obj_id = parts[i+1]
				#print(obj_id)
				if obj_id:
					kwargs['queryset'] = Spec.objects.filter(projecte=obj_id).order_by('ordre')
				else:
					kwargs['queryset'] = Spec.objects.none()
			except:
				print("ERROR in formfield_for_manytomany (SprintInline)")
		return super().formfield_for_manytomany(db_field, request=request, **kwargs)

class ProjecteAdmin(admin.ModelAdmin):
	model = Projecte
	form = ProjecteForm
	list_display = ('nom','centre','inici','final','cicle')
	inlines = ( SprintInline, SpecInline, )

from urllib.parse import urlsplit
class SpecAdmin(SortableAdminMixin,admin.ModelAdmin):
	model = Spec
	search_fields = ('projecte__nom','mp__nom',)
	filter_horizontal = ('mp',)
	list_display = ('nom','projecte','moduls','ordre',)
	ordering = ('ordre',)
	form = SpecForm
	def moduls(self,obj):
		mps = ""
		for mp in obj.mp.all():
			mps += mp.nom + "<br>"
		return mark_safe(mps)
	def formfield_for_manytomany(self, db_field, request=None, **kwargs):
		if db_field.name == 'mp':
			try:
				parts = request.get_raw_uri().split("/")
				i = parts.index("spec")
				#print("I="+str(i))
				obj_id = parts[i+1]
				#print(obj_id)
				obj = self.get_object(request,obj_id)
				if obj:
					kwargs['queryset'] = ModulProfessional.objects.filter(cicle=obj.projecte.cicle).order_by('numero')
				else:
					kwargs['queryset'] = Spec.objects.none()
			except:
				print("ERROR in formfield_for_manytomany (SpecAdmin)")
		return super().formfield_for_manytomany(db_field, request=request, **kwargs)


class SprintAdmin(admin.ModelAdmin):
	model = Sprint
	list_display = ('nom','projecte','inici','final')
	form = SprintForm
	filter_horizontal = ('specs',)
	ordering = ['inici',]
	search_fields = ('projecte__nom',)
	def formfield_for_manytomany(self, db_field, request=None, **kwargs):
		if db_field.name == 'specs':
			try:
				parts = request.get_raw_uri().split("/")
				i = parts.index("sprint")
				#print("I="+str(i))
				obj_id = parts[i+1]
				print(obj_id)
				obj = self.get_object(request,obj_id)
				if obj:
					kwargs['queryset'] = Spec.objects.filter(projecte=obj.projecte).order_by('ordre')
				else:
					kwargs['queryset'] = Spec.objects.none()
			except:
				print("ERROR in formfield_for_manytomany (SprintAdmin)")
		return super().formfield_for_manytomany(db_field, request=request, **kwargs)

class DoneSpecInline(admin.TabularInline):
	model = DoneSpec
	extra = 0
	can_delete = False
	readonly_fields = ('spec','mps',)
	#list_display = ('__str__','spec__nom','done')
	def mps(self,obj):
		mps = ""
		for mp in obj.spec.mp.all():
			mps += mp.nom + "<br>"
		return mark_safe(mps)

class QualificacioAdmin(admin.ModelAdmin):
	model = Qualificacio
	list_display = ('__str__','projecte','sprint','equip','nota','comepletat','completat_mps')
	search_fields = ('sprint__projecte__nom','sprint__nom','equip__nom')
	readonly_fields = ('comepletat','equip','sprint','completat_mps')
	inlines = [ DoneSpecInline, ]
	def projecte(self,obj):
		return obj.sprint.projecte.nom
	def comepletat(self,obj):
		total = 0
		done = 0
		for spec in obj.done_specs.all():
			total += 1
			if spec.done:
				done += 1
		if total==0:
			return "-"
		return str(100*done/total)+" %"
	def completat_mps(self,obj):
		mps = {}
		for dspec in obj.done_specs.all():
			for mp in dspec.spec.mp.all():
				# si no hi ha dict, el creem
				if mp.id not in mps:
					mps[mp.id] = { "obj": mp, "total": 0, "done": 0 }
				# afegim estadístiques
				mps[mp.id]["total"] += 1
				if dspec.done:
					mps[mp.id]["done"] += 1
		# construim return string
		ret = ""
		for mpid in mps:
			dades = mps[mpid]
			mp = mps[mpid]["obj"]
			ret += mp.nom + " : "+str(100*dades["done"]/dades["total"])+ " %<br>"
		return mark_safe(ret)
	def get_form(self,*args,**kwargs):
		actualitza_qualificacions()
		return super().get_form(*args,**kwargs)

class DoneSpecAdmin(admin.ModelAdmin):
	model = DoneSpec
	list_display = ('__str__','projecte','sprint','equip','done')
	list_editable = ('done',)
	search_fields = ('qualificacio__sprint__projecte__nom','qualificacio__equip__nom','qualificacio__sprint__nom','spec__nom')
	ordering = ('qualificacio__sprint__projecte__nom','qualificacio__equip__nom','qualificacio__sprint__inici',)
	def projecte(self,obj):
		return obj.qualificacio.sprint.projecte.nom
	def sprint(self,obj):
		return obj.qualificacio.sprint.nom
	def equip(self,obj):
		return obj.qualificacio.equip.nom
	def get_form(self,*args,**kwargs):
		actualitza_qualificacions()
		return super().get_form(*args,**kwargs)

def actualitza_qualificacions():
	print("actualitzant...")
	sprints = Sprint.objects.all()
	for sprint in sprints:
		# cal crear una Qualificació per cada sprint i equip
		for equip in sprint.projecte.equips.all():
			quali = None
			qualis = Qualificacio.objects.filter(sprint=sprint,equip=equip)
			if not qualis:
				print("Creant Qualificacio per a "+sprint.nom)
				quali = Qualificacio(sprint=sprint,equip=equip)
				quali.save()
			else:
				quali = qualis[0]
			# cal crear un DoneSpec per cada Qualificació i Spec
			for spec in sprint.specs.all():
				dspecs = DoneSpec.objects.filter(qualificacio=quali,spec=spec)
				if not dspecs:
					dspec = DoneSpec(qualificacio=quali,spec=spec)
					dspec.save()



admin.site.register( Projecte, ProjecteAdmin )
admin.site.register( Spec, SpecAdmin )
admin.site.register( Sprint, SprintAdmin )
admin.site.register( Equip, EquipAdmin )
admin.site.register( Qualificacio, QualificacioAdmin )
admin.site.register( DoneSpec, DoneSpecAdmin )


