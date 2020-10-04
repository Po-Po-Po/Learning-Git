from django.urls import path

import mainapp.views as mainapp

app_name = 'mainapp'

urlpatterns = [
    path('', mainapp.index, name='index'),
    path('add/', mainapp.create, name='add'),
    path('edit/<int:pk>/', mainapp.edit, name='edit'),
    path('delete/<int:pk>/', mainapp.delete, name='delete')
]
