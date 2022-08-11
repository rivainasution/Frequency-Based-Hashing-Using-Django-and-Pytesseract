from django import forms 
from .models import Dataset, Datatest
class Datasetform(forms.ModelForm):
	class Meta:
		model = Dataset
		fields = ['dataset_judul','dataset_flie']
	
	dataset_judul = forms.CharField(
		label='Nama File',
        required = True,
        )
	dataset_flie = forms.FileField(
		label='File',
		required =  True,
		)


class Datatestform(forms.ModelForm):
	class Meta:
		model = Datatest
		fields = ['datates_judul','datates_flie']
	datates_judul = forms.CharField(
		label='Nama File',
        required = True,
        )
	datates_flie = forms.FileField(
		label='File',
		required =  True,
		)
		