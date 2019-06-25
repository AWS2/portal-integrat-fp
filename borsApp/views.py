from django.shortcuts import render

# Create your views here.


#def myForm(request):
#	form=myForm()
#	return render('index.html',{form:form})


# Create your views here.
def index(request):
    return render(request, 'borsApp/index.html', {})
