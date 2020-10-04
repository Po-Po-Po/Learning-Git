from django.forms import ModelForm
from mainapp.models import University
from django import forms


class UniversityEditForm(ModelForm):
	model = University
	fields = ['name']

	def __init__(self, *args, **kwargs):
		super(UniversityEditForm, self).__init__(*args, **kwargs)
		for field_name, field in self.fields.items():
			field.widget.attrs['class'] = 'form-control'


class UniversityCreateForm(ModelForm):
	class Meta:
		model = University
		fields = '__all__'

	def __init__(self, *args, **kwargs):
		super(UniversityCreateForm, self).__init__(*args, **kwargs)
		for field_name, field in self.fields.items():
			field.widget.attrs['class'] = 'form-control'
			field.help_text = ''

	def clean_subjects(self):
		subjects = self.cleaned_data['subjects']
		sub_list = subjects.split(',')
		if len(sub_list) < 2:
			raise forms.ValidationError("Введите больше одного предмета!")

		return subjects
