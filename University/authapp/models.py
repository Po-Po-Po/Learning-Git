from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.
class Student(AbstractUser):
	avatar = models.ImageField(verbose_name='аватар', upload_to='users_avatars', blank=True)
	age = models.PositiveIntegerField(verbose_name='возраст', default=18)

	class Meta:
		verbose_name = 'Студент'
		verbose_name_plural = 'Студенты'

	def __str__(self):
		return f'{self.username}'