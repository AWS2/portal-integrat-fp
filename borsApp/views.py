from django.shortcuts import render, redirect



from django import forms
from django.utils import timezone
from borsApp.formulario import MyForm
# Create your views here.

#def index(request):
#    return render(request,'borsApp/index.html',{})


def index(request):
 
    if request.method == "POST":
        form = MyForm(request.POST)
        if form.is_valid():
            model_instance = form.save(commit=False)
            model_instance.timestamp = timezone.now()
            model_instance.save()
            return redirect('/')
 
    else:
 
        form = MyForm()
 
        return render(request, 'borsApp/formularioWysi.html', {'form': form})

#def myForm(request):
#	form=myForm()
#	return render('index.html',{form:form})