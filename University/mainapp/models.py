from django.db import models

# Create your models here.
class University(models.Model):
	name = models.CharField(verbose_name='название университета', max_length=64, unique=True)
	address = models.CharField(verbose_name='адрес', max_length=256)
	subjects = models.TextField(verbose_name='предметы', max_length=1024)

	def __str__(self):
		return f'{self.name}'