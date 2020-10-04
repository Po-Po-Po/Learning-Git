from django.shortcuts import render, HttpResponseRedirect
from authapp.models import Student
from django.contrib import auth
from authapp.forms import StudentLoginForm, StudentRegisterForm, StudentEditForm
from django.urls import reverse
from django.contrib.auth.models import User

# Create your views here.
def login(request):
	title = 'вход'

	login_form = StudentLoginForm(data=request.POST or None)

	if request.method == 'POST' and login_form.is_valid():
		username = request.POST['username']
		password = request.POST['password']

		user = auth.authenticate(username=username, password=password)
		if user and user.is_active:
			auth.login(request, user)
			return HttpResponseRedirect(reverse('main:index'))

	content = {
		'title': title,
		'login_form': login_form,
	}

	return render(request, 'login.html', content)


def logout(request):
	auth.logout(request)
	return HttpResponseRedirect(reverse('authapp:login'))


def register(request):
	title = 'регстирация'

	if request.method == 'POST':
		register_form = StudentRegisterForm(request.POST, request.FILES)
		if register_form.is_valid():
			user_save = User.objects.create_superuser(username=request.POST['username'], password=request.POST['password'])
			user_save.save()
			return HttpResponseRedirect(reverse('auth:login'))
		else:
			register_form = StudentRegisterForm()
			content = {'title': title, 'register_form': register_form}
			return render(request, 'register.html', content)

	content = {'title': title}
	return render(request, 'register.html', content)


def edit(request):
    title = 'редактирование'
    
    if request.method == 'POST':
        edit_form = StudentEditForm(request.POST, request.FILES, instance=request.user)
        if edit_form.is_valid():
            edit_form.save()
            return HttpResponseRedirect(reverse('auth:edit'))
    else:
        edit_form = StudentEditForm(instance=request.user)
    
    content = {'title': title, 'edit_form': edit_form}
    
    return render(request, 'edit.html', content)
