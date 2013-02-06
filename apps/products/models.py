# -*- coding: utf-8 -*-
import os, datetime
from django.utils.translation import ugettext_lazy as _
from django.db import models
from django.contrib.auth.models import User

from pytils.translit import translify
from django.core.urlresolvers import reverse

from sorl.thumbnail import ImageField
from mptt.models import MPTTModel, TreeForeignKey, TreeManager

from apps.utils.managers import PublishedManager


def file_path_product(instance, filename):
    return os.path.join('images','product',  translify(filename).replace(' ', '_') )

class Product(models.Model):
    name = models.CharField(
        verbose_name=u'название', 
        max_length=100,
    )
    description_for_main = models.TextField(
        verbose_name = u'описание для главной',
    )
    description = models.TextField(
        verbose_name = u'описание для страницы конструкции',
    )
    alias = models.CharField(
        verbose_name = u'Алиас', 
        max_length = 100, 
        unique = True
    )
    image = ImageField(
        verbose_name = u'Картинка', 
        upload_to = file_path_product
    )
    draft = ImageField(
        verbose_name = u'Чертеж', 
        upload_to = file_path_product
    )
    order = models.IntegerField(
        verbose_name = u'Порядок сортировки',
        default = 10
    )
    is_published = models.BooleanField(
        verbose_name = u'Опубликовано', 
        default = True
    )

    objects = PublishedManager()

    def __unicode__(self):
            return self.name

    class Meta:
        verbose_name = u'тип конструкции'
        verbose_name_plural = u'типы конструкций'
        ordering = ['-order', 'name']

    def get_absolute_url(self):
        return u"/%s/" % self.alias

def file_path_image_type(instance, filename):
    return os.path.join('images','product',  translify(filename).replace(' ', '_') )

class ImageType(models.Model):
    name = models.CharField(
        verbose_name=u'название', 
        max_length=100,
    )
    icon_for_main = ImageField(
        verbose_name = u'Икнока на главную', 
        upload_to = file_path_image_type
    )
    icon = ImageField(
        verbose_name = u'Иконка', upload_to = file_path_image_type
    )
    order = models.IntegerField(
        verbose_name = u'Порядок сортировки',
        default = 10
    )
    is_published = models.BooleanField(verbose_name = u'Опубликовано', default=True)

    objects = PublishedManager()

    def __unicode__(self):
            return self.name

    class Meta:
        verbose_name = u'применение'
        verbose_name_plural = u'применения'
        ordering = ['-order', 'name']

def file_path_product_image(instance, filename):
    return os.path.join('images','product_image',  translify(filename).replace(' ', '_') )

class ProductImage(models.Model):
    product = models.ForeignKey(
        Product,
        verbose_name=u'тип конструкции', 
    )
    type = models.ForeignKey(
        ImageType,
        verbose_name=u'применение', 
    )
    image = ImageField(
        verbose_name = u'Картинка', 
        upload_to = file_path_product_image
    )

    order = models.IntegerField(
        verbose_name = u'Порядок сортировки',
        default = 10
    )
    is_published = models.BooleanField(
        verbose_name = u'Опубликовано', 
        default = True
    )

    objects = PublishedManager()

    class Meta:
        verbose_name = u'фото конструкций'
        verbose_name_plural = u'фото конструкций'
        ordering = ['-order',]

def file_path_property(instance, filename):
    return os.path.join('images','property',  translify(filename).replace(' ', '_') )

class Property(models.Model):
    name = models.CharField(
        verbose_name=u'название', 
        max_length=100,
    )
    image = ImageField(
        verbose_name = u'Картинка', 
        upload_to = file_path_property
    )
    description = models.TextField(
        verbose_name = u'описание для главной',
    )
    on_product_page = models.BooleanField(
        verbose_name = u'На внутренних страницах', 
        default = False,
    )
    order = models.IntegerField(
        verbose_name = u'Порядок сортировки',
        default = 10
    )
    is_published = models.BooleanField(
        verbose_name = u'Опубликовано', 
        default = True
    )

    objects = PublishedManager()

    def __unicode__(self):
            return self.name

    class Meta:
        verbose_name = u'свойство'
        verbose_name_plural = u'свойства'
        ordering = ['-order', 'name']

def file_path_property(instance, filename):
    return os.path.join('images','property',  translify(filename).replace(' ', '_') )

class Tech(models.Model):
    name = models.CharField(
        verbose_name=u'название', 
        max_length=100,
    )
    description = models.TextField(
        verbose_name = u'описание для главной',
        blank = True,
    )
    description_2 = models.TextField(
        verbose_name = u'описание 2',
        blank = True,
        null=True,
    )
    alias = models.CharField(
        verbose_name = u'Алиас', 
        max_length = 100, 
        unique = True
    )
    image = ImageField(
        verbose_name = u'Картинка', 
        upload_to = file_path_property,
        blank = True,
    )
    order = models.IntegerField(
        verbose_name = u'Порядок сортировки',
        default = 10
    )
    is_published = models.BooleanField(
        verbose_name = u'Опубликовано', 
        default = True
    )

    objects = PublishedManager()

    def __unicode__(self):
            return self.name

    class Meta:
        verbose_name = u'описание технологии'
        verbose_name_plural = u'описание технологии'
        ordering = ['-order', 'name']

def file_path_tech_property(instance, filename):
    return os.path.join('images','tech_property',  translify(filename).replace(' ', '_') )

class TechProperty(models.Model):
    tech = models.ForeignKey(
        Tech,
        verbose_name=u'описание технологие', 
    )
    name = models.CharField(
        verbose_name=u'название', 
        max_length=100,
    )
    image1 = ImageField(
        verbose_name = u'Картинка', 
        upload_to = file_path_tech_property
    )
    description = models.TextField(
        verbose_name = u'описание для главной',
    )
    image2 = ImageField(
        verbose_name = u'Картинка2', 
        upload_to = file_path_tech_property,
        blank = True,
        null = True,
    )
    image3 = ImageField(
        verbose_name = u'Картинка2', 
        upload_to = file_path_tech_property,
        blank = True,
        null = True,
    )
    order = models.IntegerField(
        verbose_name = u'Порядок сортировки',
        default = 10
    )
    is_published = models.BooleanField(
        verbose_name = u'Опубликовано', 
        default = True
    )

    objects = PublishedManager()

    class Meta:
        verbose_name = u'пояснение'
        verbose_name_plural = u'пояснения'
        ordering = ['-order', 'name']

class Request(models.Model):
    product = models.ForeignKey(
        Product,
        verbose_name=u'тип конструкции', 
    )
    description = models.TextField(
        verbose_name=u'описание заявки', 
    )
    name = models.CharField(
        verbose_name=u'имя', 
        max_length=100,
    )
    phone = models.CharField(
        verbose_name=u'телефон', 
        max_length=100,
    )
    email = models.EmailField(
        verbose_name=u'электронная почта', 
        blank = True,
        null = True,
    )
    date = models.DateTimeField(
        verbose_name = u'дата',
        default = datetime.datetime.now,
    )
    class Meta:
        verbose_name = u'заявка'
        verbose_name_plural = u'заявки'
        ordering = ['-date',]


