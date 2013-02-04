# -*- coding: utf-8 -*-
from django.utils.translation import ugettext_lazy as _
from django.contrib import admin
from django import forms
from apps.utils.widgets import Redactor
from sorl.thumbnail.admin import AdminImageMixin
from mptt.admin import MPTTModelAdmin


from models import *

class ImageInline(admin.TabularInline):
    model = ProductImage
    extra = 0

class ProductAdminForm(forms.ModelForm):
    description = forms.CharField(widget=Redactor(attrs={'cols': 110, 'rows': 40}),)
    description.label=u'Описание'

    class Meta:
        model = Product
#--Виджеты jquery Редактора
class ProductAdmin(AdminImageMixin, admin.ModelAdmin):
    list_display = ('name', 'order','is_published',)
    list_display_links = ('name',)
    list_editable = ('order','is_published',)
    list_filter = ('is_published',)
    inlines = [ImageInline]
    form = ProductAdminForm

admin.site.register(Product, ProductAdmin)

class ImageTypeAdmin(AdminImageMixin, admin.ModelAdmin):
    list_display = ('name', 'order','is_published',)
    list_display_links = ('name',)
    list_editable = ('order','is_published',)
    list_filter = ('is_published',)

admin.site.register(ImageType, ImageTypeAdmin)

class PropertyAdmin(AdminImageMixin, admin.ModelAdmin):
    list_display = ('name', 'order','on_product_page', 'is_published',)
    list_display_links = ('name',)
    list_editable = ('order','is_published', 'on_product_page',)
    list_filter = ('is_published', 'on_product_page',)

admin.site.register(Property, PropertyAdmin)

class TechPropertyInline(admin.TabularInline):
    model = TechProperty
    extra = 0

class TechAdminForm(forms.ModelForm):
    description = forms.CharField(widget=Redactor(attrs={'cols': 110, 'rows': 20}),)
    description.label=u'Описание'

    class Meta:
        model = Tech

class TechAdmin(AdminImageMixin, admin.ModelAdmin):
    list_display = ('name', 'order','is_published',)
    list_display_links = ('name',)
    list_editable = ('order','is_published',)
    list_filter = ('is_published',)
    inlines = [TechPropertyInline]
    form = TechAdminForm

admin.site.register(Tech, TechAdmin)

class RequestAdmin(admin.ModelAdmin):
    list_display = ('product', 'description','name', 'phone', 'email', 'date')
    list_display_links = ('product',)
    list_filter = ('product',)

admin.site.register(Request, RequestAdmin)