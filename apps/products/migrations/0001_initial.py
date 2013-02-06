# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Product'
        db.create_table('products_product', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('description_for_main', self.gf('django.db.models.fields.TextField')()),
            ('description', self.gf('django.db.models.fields.TextField')()),
            ('alias', self.gf('django.db.models.fields.CharField')(unique=True, max_length=100)),
            ('image', self.gf('sorl.thumbnail.fields.ImageField')(max_length=100)),
            ('draft', self.gf('sorl.thumbnail.fields.ImageField')(max_length=100)),
            ('order', self.gf('django.db.models.fields.IntegerField')(default=10)),
            ('is_published', self.gf('django.db.models.fields.BooleanField')(default=True)),
        ))
        db.send_create_signal('products', ['Product'])

        # Adding model 'ImageType'
        db.create_table('products_imagetype', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('icon_for_main', self.gf('sorl.thumbnail.fields.ImageField')(max_length=100)),
            ('icon', self.gf('sorl.thumbnail.fields.ImageField')(max_length=100)),
            ('order', self.gf('django.db.models.fields.IntegerField')(default=10)),
            ('is_published', self.gf('django.db.models.fields.BooleanField')(default=True)),
        ))
        db.send_create_signal('products', ['ImageType'])

        # Adding model 'ProductImage'
        db.create_table('products_productimage', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('product', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['products.Product'])),
            ('type', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['products.ImageType'])),
            ('image', self.gf('sorl.thumbnail.fields.ImageField')(max_length=100)),
            ('order', self.gf('django.db.models.fields.IntegerField')(default=10)),
            ('is_published', self.gf('django.db.models.fields.BooleanField')(default=True)),
        ))
        db.send_create_signal('products', ['ProductImage'])

        # Adding model 'Property'
        db.create_table('products_property', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('image', self.gf('sorl.thumbnail.fields.ImageField')(max_length=100)),
            ('description', self.gf('django.db.models.fields.TextField')()),
            ('on_product_page', self.gf('django.db.models.fields.BooleanField')(default=False)),
            ('order', self.gf('django.db.models.fields.IntegerField')(default=10)),
            ('is_published', self.gf('django.db.models.fields.BooleanField')(default=True)),
        ))
        db.send_create_signal('products', ['Property'])

        # Adding model 'Tech'
        db.create_table('products_tech', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('description', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('alias', self.gf('django.db.models.fields.CharField')(unique=True, max_length=100)),
            ('image', self.gf('sorl.thumbnail.fields.ImageField')(max_length=100, blank=True)),
            ('order', self.gf('django.db.models.fields.IntegerField')(default=10)),
            ('is_published', self.gf('django.db.models.fields.BooleanField')(default=True)),
        ))
        db.send_create_signal('products', ['Tech'])

        # Adding model 'TechProperty'
        db.create_table('products_techproperty', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('tech', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['products.Tech'])),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('image1', self.gf('sorl.thumbnail.fields.ImageField')(max_length=100)),
            ('description', self.gf('django.db.models.fields.TextField')()),
            ('image2', self.gf('sorl.thumbnail.fields.ImageField')(max_length=100, null=True, blank=True)),
            ('image3', self.gf('sorl.thumbnail.fields.ImageField')(max_length=100, null=True, blank=True)),
            ('order', self.gf('django.db.models.fields.IntegerField')(default=10)),
            ('is_published', self.gf('django.db.models.fields.BooleanField')(default=True)),
        ))
        db.send_create_signal('products', ['TechProperty'])

        # Adding model 'Request'
        db.create_table('products_request', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('product', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['products.Product'])),
            ('description', self.gf('django.db.models.fields.TextField')()),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('phone', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('email', self.gf('django.db.models.fields.EmailField')(max_length=75, null=True, blank=True)),
            ('date', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime.now)),
        ))
        db.send_create_signal('products', ['Request'])


    def backwards(self, orm):
        # Deleting model 'Product'
        db.delete_table('products_product')

        # Deleting model 'ImageType'
        db.delete_table('products_imagetype')

        # Deleting model 'ProductImage'
        db.delete_table('products_productimage')

        # Deleting model 'Property'
        db.delete_table('products_property')

        # Deleting model 'Tech'
        db.delete_table('products_tech')

        # Deleting model 'TechProperty'
        db.delete_table('products_techproperty')

        # Deleting model 'Request'
        db.delete_table('products_request')


    models = {
        'products.imagetype': {
            'Meta': {'ordering': "['-order', 'name']", 'object_name': 'ImageType'},
            'icon': ('sorl.thumbnail.fields.ImageField', [], {'max_length': '100'}),
            'icon_for_main': ('sorl.thumbnail.fields.ImageField', [], {'max_length': '100'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'is_published': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'order': ('django.db.models.fields.IntegerField', [], {'default': '10'})
        },
        'products.product': {
            'Meta': {'ordering': "['-order', 'name']", 'object_name': 'Product'},
            'alias': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '100'}),
            'description': ('django.db.models.fields.TextField', [], {}),
            'description_for_main': ('django.db.models.fields.TextField', [], {}),
            'draft': ('sorl.thumbnail.fields.ImageField', [], {'max_length': '100'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'image': ('sorl.thumbnail.fields.ImageField', [], {'max_length': '100'}),
            'is_published': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'order': ('django.db.models.fields.IntegerField', [], {'default': '10'})
        },
        'products.productimage': {
            'Meta': {'ordering': "['-order']", 'object_name': 'ProductImage'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'image': ('sorl.thumbnail.fields.ImageField', [], {'max_length': '100'}),
            'is_published': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'order': ('django.db.models.fields.IntegerField', [], {'default': '10'}),
            'product': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['products.Product']"}),
            'type': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['products.ImageType']"})
        },
        'products.property': {
            'Meta': {'ordering': "['-order', 'name']", 'object_name': 'Property'},
            'description': ('django.db.models.fields.TextField', [], {}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'image': ('sorl.thumbnail.fields.ImageField', [], {'max_length': '100'}),
            'is_published': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'on_product_page': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'order': ('django.db.models.fields.IntegerField', [], {'default': '10'})
        },
        'products.request': {
            'Meta': {'ordering': "['-date']", 'object_name': 'Request'},
            'date': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'description': ('django.db.models.fields.TextField', [], {}),
            'email': ('django.db.models.fields.EmailField', [], {'max_length': '75', 'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'phone': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'product': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['products.Product']"})
        },
        'products.tech': {
            'Meta': {'ordering': "['-order', 'name']", 'object_name': 'Tech'},
            'alias': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '100'}),
            'description': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'image': ('sorl.thumbnail.fields.ImageField', [], {'max_length': '100', 'blank': 'True'}),
            'is_published': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'order': ('django.db.models.fields.IntegerField', [], {'default': '10'})
        },
        'products.techproperty': {
            'Meta': {'ordering': "['-order', 'name']", 'object_name': 'TechProperty'},
            'description': ('django.db.models.fields.TextField', [], {}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'image1': ('sorl.thumbnail.fields.ImageField', [], {'max_length': '100'}),
            'image2': ('sorl.thumbnail.fields.ImageField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'image3': ('sorl.thumbnail.fields.ImageField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'is_published': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'order': ('django.db.models.fields.IntegerField', [], {'default': '10'}),
            'tech': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['products.Tech']"})
        }
    }

    complete_apps = ['products']