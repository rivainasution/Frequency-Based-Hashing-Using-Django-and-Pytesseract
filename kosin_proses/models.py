from django.db import models

# Create your models here.

class Dataset(models.Model):
	dataset_judul = models.TextField()
	dataset_flie = models.FileField(blank=False, null=False)

class Datatest(models.Model):
	datates_judul = models.TextField()
	datates_flie = models.FileField(blank=False,null=False)

class Tf(models.Model):
	kata = models.CharField(max_length=225)
	frequency = models.IntegerField(default=0)
	dataset_id = models.IntegerField(default=0)
	dataset_judul = models.TextField()