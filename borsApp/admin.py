from django.contrib import admin
from django import forms

# Register your models here.

from borsApp.models import *
from borsApp.views import filtra_ofertes_alumne
from core.models import Cicle
from django.contrib.auth.models import Group

# no cal form de select2 pq ho posem per a tot l'admin amb django-admin-select2
"""from easy_select2 import select2_modelform
from django_select2.forms import Select2Widget

TitolForm = select2_modelform(Titol)#,attrs={"width":"450px"})
SubscripcioForm = select2_modelform(Subscripcio)"""


class EmpresaAdmin(admin.ModelAdmin):
    list_display = ('nom','poblacio','get_admins','get_centres')
    filter_horizontal = ('admins','adscripcio')
    def get_queryset(self,request):
        qs = super().get_queryset(request)
        if request.user.is_superuser:
            # el super ho veu tot
            return qs
        elif request.user.es_admin_centre:
            # el admin centre veu totes les empreses q te adscrites
            centres = request.user.centres_admin.all()
            return qs.filter(adscripcio__in=centres)
        elif request.user.es_admin_empresa:
            # l'empresa només es veu a sí mateixa
            return qs.filter(id__in=request.user.empreses_admin.all())
        # aqui no hauriem d'arribar
        raise Exception("ERROR: EmpresaAdmin.get_queryset , permís denegat")
    def get_admins(self,obj):
        res = ""
        for admin in obj.admins.all():
            res += admin.username + ", "
        return res
    def get_centres(self,obj):
        res = ""
        for centre in obj.adscripcio.all():
            res += centre.nom + ", "
        return res
    def get_form(self,request,obj=None,**kwargs):
        self.readonly_fields = ()
        # l'empresa no pot manipular els admins
        if request.user.es_admin_empresa:
            self.readonly_fields = ('admins',)
        return super().get_form(request,obj,**kwargs)
    def save_related(self,request,form,formset,change):
        # guardem el que s'hagi marcat
        super().save_related(request,form,formset,change)
        if request.user.is_superuser:
            # el superuser pot fer tot, i no li afegim ni traiem res
            return
        # si no és super, forcem a que es crein usuari d'empresa i adscripcio de centre
        if not form.cleaned_data["admins"]:
            # afegim usuari d'empresa si no en te
            # busquem email/empresa si ja existeix
            nom = form.cleaned_data["nom"]
            email = form.cleaned_data["email"]
            users = User.objects.filter(email=email)
            user = None
            if users:
                user = users[0]
            else:
                # TODO: corregir mes possibles caracters estranys en username
                username = nom.replace(" ","_").replace("@","_")
                user = User(username=username,first_name=nom,email=email,is_staff=True)
                user.save()
            # afegim usuari al grup d'empreses
            gempresa = Group.objects.get(name="admin_empresa")
            user.groups.add(gempresa)
            # associem usuari a l'empresa
            form.instance.admins.add(user)
        if not form.cleaned_data["adscripcio"]:
            # associem empresa al(s) centre(s) del nostre usuari, si es admin centres
            if request.user.es_admin_centre and not form.instance.adscripcio.all():
                centres = request.user.centres_admin.all()
                for centre in centres:
                    if centre not in form.instance.adscripcio.all():
                        form.instance.adscripcio.add(centre)

class TitolAdmin(admin.ModelAdmin):
    list_display = ('alumne','nom','cicle','centre')
    # no cal form de select2 pq ho posem per a tot l'admin amb django-admin-select2
    #form = TitolForm
    def nom(self,obj):
        return obj.alumne.first_name+" "+obj.alumne.last_name+" (email: "+obj.alumne.email+")"
    def get_queryset(self,request):
        qs = super().get_queryset(request)
        if request.user.is_superuser:
            # super ho veu tot
            return qs
        elif request.user.es_admin_centre:
            # admins centre veuen els titols dels seus alumnes
            centres = request.user.centres_admin.all()
            return qs.filter(centre__in=centres)
        elif request.user.es_admin_empresa:
            # els admin empresa no han de veure res
            return Titol.objects.none()
        # si és alumne només veu els seus títols
        return qs.filter(alumne=request.user)

class SubscripcioAdmin(admin.ModelAdmin):
    list_display = ('alumne','centre_educatiu','centre_treball','get_cats','get_cicles','distancia')
    #form = SubscripcioForm
    filter_horizontal = ('categories','cicles')
    def get_cats(self,obj):
        ret = ""
        for cat in obj.categories.all():
            ret += str(cat) + ", "
        return ret
    def get_cicles(self,obj):
        ret = ""
        for cicle in obj.cicles.all():
            ret += str(cicle) + ", "
        return ret
    def get_form(self,request,obj=None,**kwargs):
        # l'alumne no pot triar quin alumne subscriu. Els admins sí
        self.exclude = None
        if request.user.es_alumne:
            self.exclude = ('alumne',)
        return super().get_form(request,obj,**kwargs)
    def formfield_for_foreignkey(self,db_field,request=None,**kwargs):
        # filtre camp alumne
        if db_field.name=="alumne":
            if request.user.es_admin_centre:
                # filtrem els usuaris del centre del qual es admin
                kwargs["queryset"] = User.objects.filter(centre__in=request.user.centres_admin.all())
            elif request.user.es_alumne:
                kwargs["queryset"] = User.objects.none()
            elif request.user.is_superuser:
                kwargs["queryset"] = User.objects.all()
        return super().formfield_for_foreignkey(db_field,request=request,**kwargs)
    def save_model(self,request,obj,form,change):
        # forcem alumne a ser l'usuari en curs
        # els admins poden subscriure qualsevol alumne
        if request.user.es_alumne:
            obj.alumne = request.user
        super().save_model(request,obj,form,change)
    def get_queryset(self,request):
        if request.user.is_superuser:
            # superuser ho veu tot
            return super().get_queryset(request)
        elif request.user.es_admin_centre:
            # els admins veuen tot lo del seu centre
            centres = request.user.centres_admin.all()
            return super().get_queryset(request).filter(alumne__centre__in=centres)
        # nomes mostrem les de l'alumne
        return super().get_queryset(request).filter(alumne=request.user)



class TitolInline(admin.TabularInline):
    model = Titol
    #form = TitolForm
    extra = 1
    readonly_fields = ('descripcio',)
class SubscripcioInline(admin.StackedInline):
    model = Subscripcio
    #form = SubscripcioForm
    extra = 1

from datetime import datetime

#OfertaForm = select2_modelform(Oferta)
class OfertaAdmin(admin.ModelAdmin):
    model = Oferta
    #form = OfertaForm
    filter_horizontal = ('cicles',)
    readonly_fields = ('creador',)
    list_display = ('titol','empresa','inici','final','activa',)
    ordering = ('-inici','empresa',)
    """def get_form(self,request,obj=None,**kwargs):
        # l'empresa no pot triar quina empresa fa la oferta. Els admins sí
        self.readonly_fields = ('creador','empresa',)
        if request.user.es_admin_centre:
            self.readonly_fields = ('creador',)
        return super().get_form(request,obj,**kwargs)"""
    def formfield_for_foreignkey(self,db_field,request=None,**kwargs):
        # filtre camp empresa
        if db_field.name=="empresa":
            # si es admin_centre, filtrar empreses adscrites al centre
            if request.user.es_admin_centre:
                centres = request.user.centres_admin.all()
                kwargs["queryset"] = Empresa.objects.filter(adscripcio__in=centres)
            elif request.user.es_admin_empresa:
                # admin empresa pot triar les empreses que administra
                kwargs["queryset"] = request.user.empreses_admin.all()
        return super().formfield_for_foreignkey(db_field,request=request,**kwargs)
    def formfield_for_manytomany(self,db_field,request=None,**kwargs):
        # filtre camp cicles
        if db_field.name=="cicles":
            # filtrem per cicles dels centres adscrits a l'empresa/es
            if request.user.es_admin_empresa:
                empreses = request.user.empreses_admin.all()
                centres = Centre.objects.filter(empreses__in=empreses)
                kwargs["queryset"] = Cicle.objects.filter(centres__in=centres)
            # si es admin_cicle pot posar l'etiqueta dels cicles del seu centre
            elif request.user.es_admin_centre:
                centres = request.user.centres_admin.all()
                kwargs["queryset"] = Cicle.objects.filter(centres__in=centres)
        return super().formfield_for_foreignkey(db_field,request=request,**kwargs)
    def save_model(self,request,obj,form,change):
        # afegim l'usuari creador de la oferta
        obj.creador = request.user
        # afegim empresa de l'usuari d'empresa
        #if request.user.es_admin_empresa:
        #    obj.empresa = request.user.empreses_admin.first()
        super().save_model(request,obj,form,change)
    def get_queryset(self,request):
        # Queryset Ofertes
        qs = super().get_queryset(request)
        if request.user.is_superuser:
            # super ho veu tot
            return qs
        elif request.user.es_admin_centre:
            # els admins centre veuen les ofertes de les empreses adscrites
            centres = request.user.centres_admin.all()
            empreses = Empresa.objects.filter(adscripcio__in=centres)
            return qs.filter(empresa__in=empreses)
        elif request.user.es_admin_empresa:
            # les empreses veuen les seves ofertes
            return qs.filter(empresa__in=request.user.empreses_admin.all())

        # la resta (ALUMNES) veuen només les ofertes dels seus estudis
        return filtra_ofertes_alumne(request.user)


class NotificacioAdmin(admin.ModelAdmin):
    list_display = ('oferta','data_oferta','usuari','email','enviament','confirmacio')
    readonly_fields = ('oferta','data_oferta','usuari','email','enviament','confirmacio','registre')
    ordering = ('-enviament',)
    def data_oferta(self,obj):
        return obj.oferta.inici
    def get_queryset(self,request):
        qs = super().get_queryset(request)
        # super ho veu tot
        if request.user.is_superuser:
            return qs
        elif request.user.es_admin_centre:
            # els admin centres veuen els relacionats amb el seu centre
            return qs.filter(usuari__centre__in=request.user.centres_admin.all())


admin.site.register( Empresa, EmpresaAdmin )
admin.site.register( Titol, TitolAdmin )
#admin.site.register( Subscripcio, SubscripcioAdmin )
admin.site.register( Oferta, OfertaAdmin )
admin.site.register( Notificacio, NotificacioAdmin )

