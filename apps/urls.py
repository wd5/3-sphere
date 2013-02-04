# -*- coding: utf-8 -*-
from django.conf.urls.defaults import patterns, include, url

#from apps.app.urls import urlpatterns as app_url

from views import index, product, technology

urlpatterns = patterns('',
    url(r'^$', index, name='index'),
    url(r'^technology/$', technology, name='technology'),
    url(r'^(?P<slug>[\w-]+)/$', product, name='product'),
)
