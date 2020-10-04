from django.shortcuts import render, HttpResponseRedirect, get_object_or_404
from mainapp.models import University
from django.urls import reverse, reverse_lazy
from mainapp.forms import UniversityEditForm, UniversityCreateForm
from django.contrib.auth.decorators import login_required
from django.views.generic.detail import DetailView
from django.contrib.auth.decorators import user_passes_test
from django.views.generic.edit import DeleteView


@user_passes_test(lambda u: u.is_authenticated)
def index(request):

	title = 'главная'

	universitys = University.objects.all()

	content = {
	'title': title,
	'universitys': universitys,
	'user': request.user,
	}
	return render(request, 'mainapp/index.html', content)


@user_passes_test(lambda u: u.is_authenticated)
def create(request):

	title = 'добавление'

	if request.method == 'POST':
		subjects = request.POST['subjects']
		create_form = UniversityCreateForm(request.POST, request.FILES)
		if create_form.is_valid():
			create_form.save()
			return HttpResponseRedirect(reverse('main:index'))
	else:
		create_form = UniversityCreateForm()

	content = {
	'title': title,
	'create_form': create_form,
	}
	return render(request, 'mainapp/university_add.html', content)


@user_passes_test(lambda u: u.is_authenticated)
def edit(request, pk=None):

	title = 'редактирование'
	edit_university = get_object_or_404(University, pk=pk)

	content = {
		'title': title,
		'edit_university': edit_university,
	}

	return render(request, 'mainapp/university_edit.html', content)


@user_passes_test(lambda u: u.is_authenticated)
def delete(request, pk=None):
    title = 'удаление'

    univers = get_object_or_404(University, pk=pk)

    if request.method == 'POST':
    	univers.delete()
    	return HttpResponseRedirect(reverse('main:index'))

    content = {
    	'title': title,
    	'univers': univers, 
    }

    return render(request, 'mainapp/university_delete.html', content)