from django import forms
from django.contrib.auth.forms import AuthenticationForm, UserCreationForm
from authapp.models import Student
from django.contrib.auth.forms import UserChangeForm


class StudentLoginForm(AuthenticationForm):
	class Meta:
		model = Student
		fields = ('username', 'password')

	def __init__(self, *args, **kwargs):
		super(StudentLoginForm, self).__init__(*args, **kwargs)
		for field_name, field in self.fields.items():
			field.widget.attrs['class'] = 'form-control'


class StudentRegisterForm(UserCreationForm):
	class Meta:
		model = Student
		fields = ('username', 'first_name', 'password1', 'password2', 'email', 'age', 'avatar')

	def __init__(self, *args, **kwargs):
		super(StudentRegisterForm, self).__init__(*args, **kwargs)
		for field_name, field in self.fields.items():
			field.widget.attrs['class'] = 'form-control'
			field.help_text = ''


class StudentEditForm(UserChangeForm):
	class Meta:
		model = Student
		fields = ('username', 'first_name', 'email', 'age', 'avatar', 'password')

	def __init__(self, *args, **kwargs):
		super(StudentEditForm, self).__init__(*args, **kwargs)
		for field_name, field in self.fields.items():
			field.widget.attrs['class'] = 'form-control'
			field.help_text = ''
			if field_name == 'password':
				field.widget = forms.HiddenInput()