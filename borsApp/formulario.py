from django.forms import ModelForm
from borsApp.models import Formulario

 
class MyForm(ModelForm):

    class Meta:
        model = Formulario
        fields = ['titulo','descripcion']