
from django.contrib import admin
from django.urls import path, include
from django.conf.urls import url
from django.conf import settings
from django.views.static import serve


from . import views

urlpatterns = [
    path('admin/', admin.site.urls),

    path('',views.index),
    path('dashboard',views.dashboard, name='dashboard'),
    path('login',views.login, name="login"),
    path('data/',include('kosin_proses.urls')),
    url(r'^media/(?P<path>.*)$', serve, {'document_root': settings.MEDIA_ROOT,})

]
