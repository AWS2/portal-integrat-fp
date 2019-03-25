from django.shortcuts import render

# Create your views here.
def loginOAuth(request):

    return render(request, 'login.html')