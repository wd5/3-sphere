# -*- coding: utf-8 -*-
from django.views.generic import TemplateView, DetailView, ListView, CreateView
from apps.products.models import Product, Property, Tech, Request
from apps.siteblocks.models import Settings

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
		context['products'] = Product.objects.published()
		context['properties'] = Property.objects.published().filter(on_product_page=True)
		return context
product = ProductView.as_view()

class TechView(ListView):
	model = Tech
	template_name = 'technology.html'
	queryset = model.objects.published()
	context_object_name = 'list'

	def get_context_data(self, **kwargs):
		context = super(TechView,self).get_context_data(**kwargs)
		context['products'] = Product.objects.published()
		context['properties'] = Property.objects.published().filter(on_product_page=True)
		return context
technology = TechView.as_view()

class CalculationView(TemplateView):
    template_name = 'calculation.html'

    def get_context_data(self, **kwargs):
        context = super(CalculationView,self).get_context_data(**kwargs)
        try:
        	context['price'] = Settings.objects.get(name='price').value
        	context['price_warm'] = Settings.objects.get(name='price_warm').value
        except:
        	pass
        return context
calculation = CalculationView.as_view()

class RequestView(CreateView):
	template_name = 'request.html'
	model = Request
	success_url = u'/thanks/'
request = RequestView.as_view()

class ContactsView(TemplateView):
    template_name = 'contacts.html'

    def get_context_data(self, **kwargs):
        context = super(ContactsView, self).get_context_data(**kwargs)
        context['products'] = Product.objects.published()
        return context
contacts = ContactsView.as_view()