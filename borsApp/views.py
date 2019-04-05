from django.shortcuts import render

# Create your views here.
def index(request):
    return render(request, 'borsApp/index.html', {})
    
def login(request):
    return render(request, 'borsApp/login.html', {})

def oferta(request):
    return render(request, 'borsApp/oferta.html', {})