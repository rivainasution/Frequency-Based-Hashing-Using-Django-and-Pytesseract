from django.shortcuts import render, redirect
from django.shortcuts import get_object_or_404
from django.contrib import messages
from django.http import HttpResponse
from .forms import Datasetform, Datatestform
from .models import Dataset, Datatest, Tf
from django.urls import reverse
from django.core.files.storage import default_storage
from math import log10
from math import sqrt
from random import choice
import requests
import os
import pytesseract
from PIL import Image	 
import pandas as pd
import time


awal = time.time()
def dataset_insert(request):
	context = {
		'page_title': 'FbHash Similarity Hashing',
		'title': 'Tambah Dataset',
		'url': reverse('proses_dataset'),
		'form' : Datasetform(),
	}
	return render(request,'form.html',context)

def dataset_proses(request):
	if request.method == 'POST':
		form = Datasetform(request.POST, request.FILES)
		if form.is_valid():
			form.save()
			obj = Dataset.objects.latest('id')
			a = obj.pk
			return redirect('/data/convert/'+str(a))
		else:
			return redirect('/data/insert_dataset')
	else :
		return redirect('/data/insert_dataset')
	

def convert(request,id):	
	instance = get_object_or_404(Dataset, id=id)
	data_dataset = Dataset.objects.filter(id=id).values()
	for data in data_dataset:
		file =  data.get('dataset_flie')
		id_dataset =  data.get('id')
		judul = data.get('dataset_judul')
				 
	file = Image.open('media/'+ file)	 
	pytesseract.pytesseract.tesseract_cmd ='C:/Program Files (x86)/Tesseract-OCR/tesseract.exe'
	text_dataset = pytesseract.image_to_string(file) 

	n = len(text_dataset)
	Ch = chunkCalc(text_dataset,n)

	numOfWordsA = dict.fromkeys(Ch, 0)
	for word in Ch:
		numOfWordsA[word] += 1
	chunk_dataset = numOfWordsA
	
	for kata in chunk_dataset:
		frequency = chunk_dataset[kata]
		check_kata = Tf.objects.filter(
	kata__icontains= kata,dataset_id__icontains = id_dataset).count()
		if check_kata > 0:
			data_tf_past = Tf.objects.filter(kata__icontains= kata).values()
			for data_tf in data_tf_past:
				past_tf = data_tf.get('frequency')

			count_tf = past_tf + chunk_dataset[kata]
			insert_tf = Tf.objects.filter(kata = kata).update(frequency=count_tf,dataset_id = id_dataset,dataset_judul = judul)
		else:
			data_tf = Tf(kata = kata, frequency = chunk_dataset[kata],dataset_id = id_dataset,dataset_judul = judul)
			data_tf.save()	

	
	return redirect('/dashboard')

def datatest_insert(request):
	context = {
		'page_title': 'FbHash Similarity Hashing',
		'title': 'Tambah Datatest',
		'url': reverse('proses_datatest'),
		'form' : Datatestform(),
	}
	return render(request,'form.html',context)

def datatest_proses(request):
	if request.method == 'POST':
		form = Datatestform(request.POST, request.FILES)
		if form.is_valid():
			form.save()
			obj = Datatest.objects.latest('id')
			a = obj.pk
			return redirect('/data/convert_datatest/'+str(a))
		else:
			
			return redirect('/data/insert_datatest')
	else :
		return redirect('/data/insert_datatest')


def convert_datatest(request,id):	
	instance = get_object_or_404(Datatest, id=id)
	data_datatest = Datatest.objects.filter(id=id).values()
	file = ''
	nama_file = ''
	text_datatest = ''
	hasil=0
	for data in data_datatest:
		file =  data.get('datates_flie')
		nama_file = data.get('datates_judul')
	
	file = Image.open('media/'+ file)	 
	pytesseract.pytesseract.tesseract_cmd ='C:/Program Files (x86)/Tesseract-OCR/tesseract.exe'
	text_datatest = pytesseract.image_to_string(file)
	
	digest_1 = fbHash_D1(text_datatest)
	
	hasil =  {}
	data_set_all_past = Tf.objects.all().values()
	id_data=[]
	for dataset_all in data_set_all_past:
		id_ = dataset_all.get('dataset_id')
		id_data.append(id_)
	i=0
	for d in set(id_data):
		hasil_ = hitung_datatest(digest_1,d,i)
		hasil[d] = hasil_
		i=i+1
		#print("hasil",hasil_)
	#print(hasil)
	
	context = {
		'page_title': 'Hasil Similarity',
		'title': 'Tambah Data Tugas Siswa',
		'score': hasil,
		'nama_file' : nama_file,
	}
	
	akhir = time.time()
	waktu = akhir-awal
	print("Waktu eksekusi adalah ",waktu)
	
	return render(request,'hasil.html',context)

def hitung_datatest(digest_1, id_datatest,i):
	data_set_id = Tf.objects.filter(dataset_id=id_datatest).values()	
	for data in data_set_id:
		datates_judul = data.get('dataset_judul')
	
	dataSet = []
	file = ''
	dataSet_db = Dataset.objects.all().values()
	for dd in dataSet_db:
		file = dd.get('dataset_flie')
		text = ''
		file = Image.open('media/'+ file)	 
		pytesseract.pytesseract.tesseract_cmd ='C:/Program Files (x86)/Tesseract-OCR/tesseract.exe'
		text = pytesseract.image_to_string(file)
		dataSet.append(text)	
	hasil = []
	for d in dataSet:
		digest_2 = fbHash(d)
		hasil_ = smlrScrCalc(digest_1,digest_2)	
		hasil.append(hasil_)

	context = {
		'judul': datates_judul,
		'hasil': hasil[i]
	}


	return context	

def fbHash_D1(D):
	n      = len(D)	 			
	Ch     = chunkCalc(D, n)		
	H      = rollHash(Ch)			
	ChfD   = chunkFrq(H)			
	Chwgt  = chunkWgt(ChfD)			
	dfCh   = docFrq_D1(Ch)			
	idfCh  = docWgt(dfCh)			
	digest = chunkScr(Chwgt, idfCh)		
	return digest

N = 1000

def chunkCalc(D, n):
	Ch = []			  
	k = 7 			   

	for i in range(0, n - 8 ):  
		Ch.append(D[i: (i + 7)])
	return Ch

def rollHash(Ch):
	H = []   		
	a = 255  		
	n = 801385653117583579  
	h = 0	 	

	for Ci in Ch: 
		k = 7
		for elm in list(Ci):
			h +=  ord(elm)*pow(a, (k - 1))
			k = k - 1
		H.append(h % n)
	return H

def chunkFrq(H):
	ChfD = {}	
	uniq = set(H) 	
	for elm in uniq:
		ChfD[elm] = H.count(elm)
	return ChfD

def chunkWgt(ChfD):
	Chwgt = []
	for elm in ChfD.keys():
		Chwgt.append(1 +log10(ChfD[elm]))
	return Chwgt

def docFrq(Ch):
	ch = [] 				  
	dfCh = {}			   
	data = Datatest.objects.all().values()
	file = ''
	for d in data:
		file =  d.get('datates_flie')
	text = ''
	file = Image.open('media/'+ file)	 
	pytesseract.pytesseract.tesseract_cmd ='C:/Program Files (x86)/Tesseract-OCR/tesseract.exe'
	text = pytesseract.image_to_string(file)
	n=len(text)
	ch=chunkCalc(text,n)

	for uniq in set(ch):		  
		n=len(Ch)
		Ch_database=chunkCalc(Ch,n)
		dfCh[uniq] = Ch_database.count(uniq)
	return dfCh

def docFrq_D1(Ch):
	dfCh = {}		
	for uniq in set(Ch):		
		dfCh[uniq] = Ch.count(uniq)
	return dfCh

def docWgt(dfCh):
	global N 			 	
	idfCh = []

	for h in dfCh.keys():
		if dfCh[h] > 0:		
			idfCh.append (log10((N/dfCh[h])))
			continue
		idfCh.append(1)	
	return idfCh

def chunkScr(Chwgt, idfCh):
	WDxCh = []			
	n=len(idfCh)

	for i in range(n):
		WDxCh.append(Chwgt[i]*idfCh[i])
	return WDxCh

def fbHash(D):
	data = Datatest.objects.all().values()
	file = ''
	for d in data:
		file =  d.get('datates_flie')
	text = ''
	file = Image.open('media/'+ file)	 
	pytesseract.pytesseract.tesseract_cmd ='C:/Program Files (x86)/Tesseract-OCR/tesseract.exe'
	text = pytesseract.image_to_string(file)

	n      = len(text)	 
	Ch     = chunkCalc(text, n)
	H      = rollHash(Ch)	
	ChfD   = chunkFrq(H)
	Chwgt  = chunkWgt(ChfD)
	dfCh   = docFrq(D)
	idfCh  = docWgt(dfCh)
	digest = chunkScr(Chwgt, idfCh)	
	return digest

def smlrScrCalc(d1, d2):
	numerator    = 0
	denomenator  = 0
	denom1       = 0
	denom2       = 0
	jumlah_d2=0
	panjang_d2=0
	
	for i in range(0, len(d1)):
		numerator += d1[i] * d2[i]
		denom1    += pow(d1[i], 2)
		denom2    += pow(d2[i], 2)

	denomenator = sqrt(denom1)*sqrt(denom2)
		
	for i in range(0, len(d1)):
		jumlah_d2 = jumlah_d2 + d2[i]
		panjang_d2 =len(d1)*1
	if (jumlah_d2 == panjang_d2):
		score = 0
	elif (numerator == 0):
		score = 0
	else:
		score = (numerator/denomenator)*100
	return score

