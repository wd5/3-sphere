# -*- coding: utf-8 -*-
from apps.products.models import Product
from apps.siteblocks.models import Settings
from django import template

register = template.Library()

@register.inclusion_tag("siteblocks/block_menu.html")
def block_menu(url):
    url = url.split('/')

    if url[1]:
        current = u'/%s/' % url[1]
    else:
        current = u'/'
    menu = Product.objects.published()
    return {'menu': menu, 'current': current}

@register.inclusion_tag("siteblocks/block_setting.html")
def block_static(name):
    try:
        setting = Settings.objects.get(name = name)
    except Settings.DoesNotExist:
        setting = False
    return {'setting': setting,}
