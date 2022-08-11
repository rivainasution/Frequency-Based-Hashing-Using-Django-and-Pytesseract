
from django.contrib import admin
from django.urls import path, include


from . import views

urlpatterns = [

    path('insert_dataset/',views.dataset_insert,name="insert_dataset"),
    path('proses_dataset/',views.dataset_proses,name="proses_dataset"),
    path('convert/<int:id>/',views.convert,name="convert"),
    
    # cosin
    path('insert_datatest/',views.datatest_insert,name="insert_datatest"),
    path('proses_datatest/',views.datatest_proses,name="proses_datatest"),
    path('convert_datatest/<int:id>/',views.convert_datatest,name="convert_datatest"),

]
