# -*- coding: utf-8 -*-
from django.conf.urls.defaults import patterns, include, url

#from apps.app.urls import urlpatterns as app_url

from views import index, product

urlpatterns = patterns('',
    url(r'^$', index, name='index'),
    url(r'^(?P<slug>[\w-]+)/$', product, name='product'),
)
