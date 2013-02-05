# -*- coding: utf-8 -*-
from django.conf.urls.defaults import patterns, include, url

#from apps.app.urls import urlpatterns as app_url

from views import index, product, technology, calculation, request, contacts

urlpatterns = patterns('',
    url(r'^$', index, name='index'),
    url(r'^technology/$', technology, name='technology'),
    url(r'^calculation/$', calculation, name='calculation'),
    url(r'^request/$', request, name='request'),
    url(r'^contacts/$', contacts, name='contacts'),
    url(r'^(?P<slug>[\w-]+)/$', product, name='product'),
)
