# from django.shortcuts import render
from django.shortcuts import  render, redirect, HttpResponse
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login as auth_login, logout as auth_logout
from django.contrib import messages
from kosin_proses.models import Dataset

# import requests
import json

# Create your views here.
def index(request):
	if request.user != 'anonymous':
		
		return redirect('dashboard')
	else:
		return render(request,'login.html')
def dashboard(request):
	dataset = Dataset.objects.all()
	context	= {
		'page_title': 'FbHash Similarity Hashing',
		'title': 'Tabel Dataset',
		'dataset' : dataset

	}
	return render(request,'page/dataset.html',context)
def login(request):
	if request.method == 'POST':
		user = authenticate(username=request.POST['username'], password=request.POST['password'])
		if user is not None:
			if user.is_active is True:
				auth_login(request, user)
				messages.add_message(request, messages.INFO, 'Selamat datang.')
				return redirect('/dashboard')
				# return HttpResponse('ok')
			else:
				return HttpResponse('gagal')
		else:
			return HttpResponse('gagal')
	else:
		return redirect('/dashboard')
# def register(request):
# 	return render(request,'register.html')