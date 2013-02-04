# -*- coding: utf-8 -*-
from django.views.generic import TemplateView, DetailView
from apps.products.models import Product, Property


class IndexView(TemplateView):
    template_name = 'index.html'

    def get_context_data(self, **kwargs):
        context = super(IndexView,self).get_context_data(**kwargs)
        context['products'] = Product.objects.published()
        context['properties'] = Property.objects.published()
        return context

index = IndexView.as_view()

class ProductView(DetailView):
	model = Product
	context_object_name = 'product'
	template_name = 'product.html'
	slug_field = 'alias'
	def get_context_data(self, **kwargs):
		context = super(ProductView,self).get_context_data(**kwargs)
		context['properties'] = Property.objects.published().filter(on_product_page=True)
		return context
product = ProductView.as_view()