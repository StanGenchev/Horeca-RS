from django.http import HttpResponseRedirect
from django.shortcuts import get_object_or_404
from django.shortcuts import render
from django.urls import reverse
from django.views import generic
from django.core.paginator import EmptyPage, PageNotAnInteger, Paginator
from django.shortcuts import render
from django.http import HttpResponse

from .models import Appellation
from .models import Categories
from .models import Countries
from .models import Regions
from .models import Vendors
from .models import Products
from .models import Users
from .models import User_rates
from .models import Experts
from .models import Expert_rates
from .models import Inventory
from .models import Characteristics_headers
from .models import Characteristics_values
from .models import Expert_product_characteristic

class IndexView(generic.ListView):
    template_name = 'hrsapp/index.html'

    def get(self, request, *args, **kwargs):
        return render(request, self.template_name)

class RecommendView(generic.ListView):
    template_name = 'hrsapp/recommend-menu.html'
    context_object_name = 'menu_objects'

    def get(self, request, *args, **kwargs):
        if request.method == 'GET':
            page = request.GET.get('page')
            category = request.GET.get('category')
            country = request.GET.get('country')
            vendor = request.GET.get('vendor')
            delete = request.GET.get("delete")
            prods = Products.objects.all()
            if page is None:
                page = 1
            if delete is not None:
                del request.session['rated']
                del request.session['vendor']
            if category is not None:
                request.session['category'] = category
                category_vendor_countries = []
                category_countries = []
                for prod in prods:
                    if int(prod.category_id.id) == int(category):
                        if int(prod.vendor_id.region_id.country_id.id) not in category_vendor_countries:
                            category_vendor_countries.append(int(prod.vendor_id.region_id.country_id.id))
                for vendor_country_id in category_vendor_countries:
                    for category_country in Countries.objects.all():
                        if int(vendor_country_id) == int(category_country.id):
                            if category_country not in category_countries:
                                category_countries.append(category_country)
                menu_objects = (0, 1, 0, 0, category_countries)
                return render(request, self.template_name, {'menu_objects': menu_objects})
            elif country is not None:
                request.session['country'] = country
                category_id = int(request.session['category'])
                vendors_filterd = []
                category_vendor_ids = []
                for prod in prods:
                    if int(prod.category_id.id) == category_id:
                        if int(prod.vendor_id.id) not in category_vendor_ids:
                            category_vendor_ids.append(int(prod.vendor_id.id))
                for vend in Vendors.objects.all():
                    if int(vend.region_id.country_id.id) == int(country) and int(vend.id) in category_vendor_ids:
                        vendors_filterd.append(vend)
                menu_objects = (0, 0, 1, 0, vendors_filterd)
                return render(request, self.template_name, {'menu_objects': menu_objects})
            elif vendor is not None:
                request.session['vendor'] = vendor
                category = request.session['category']
                country = request.session['country']
                prods_filtered = []
                for item in prods:
                    if int(item.category_id.id) == int(category):
#                        if int(item.product_id.vendor_id.region_id.country_id.id) == int(country):
                        if int(item.vendor_id.id) == int(vendor):
                            prods_filtered.append(item)
                paginator = Paginator(prods_filtered, 42)
                contents = (Categories.objects.all(), paginator.page(int(page)), 0)
                return render(request, 'hrsapp/recommend-list.html', {'product_list': contents})
            else:
                current_rates = []
                all_rated = []
                vendor = request.session['vendor']
                category = request.session['category']
                country = request.session['country']
                prods_filtered = []
                for item in prods:
                    if int(item.category_id.id) == int(category):
#                        if int(item.product_id.vendor_id.region_id.country_id.id) == int(country):
                        if int(item.vendor_id.id) == int(vendor):
                            prods_filtered.append(item)
                if request.session.get('rated') is None:
                    current_rates.append(request.GET.get('rated'))
                    request.session['rated'] = current_rates
                    for prod in prods:
                        if str(prod.id) in current_rates:
                            all_rated.append(prod)
                else:
                    current_rates = request.session['rated']
                    if request.GET.get('rated') not in current_rates:
                        current_rates.append(request.GET.get('rated'))
                        request.session['rated'] = current_rates
                    for prod in prods:
                        if str(prod.id) in current_rates:
                            all_rated.append(prod)
                paginator = Paginator(prods_filtered, 42)
                contents = (Categories.objects.all(), paginator.page(int(page)), all_rated)
                return render(request, 'hrsapp/recommend-list.html', {'product_list': contents})

class ItemView(generic.ListView):
    template_name = 'hrsapp/recommend-list.html'
    context_object_name = 'product_list'

    def get(self, request, *args, **kwargs):
        prods = Products.objects.all()
        prods_filtered = []
        if request.method == 'GET':
            page = request.GET.get('page')
            category = request.session['category']
            country = request.session['country']
            vendor = request.session['vendor']
            if page is None:
                page = 1
            if category is None or country is None or vendor is None:
                paginator = Paginator(prods, 24)
                cap = (Categories.objects.all(), paginator.page(int(page)))
                return render(request, self.template_name, {'product_list': cap})
            for item in prods:
                if int(item.category_id.id) == int(category):
#                        if int(item.product_id.vendor_id.region_id.country_id.id) == int(country):
                    if int(item.vendor_id.id) == int(vendor):
                        prods_filtered.append(item)
            paginator = Paginator(prods_filtered, 42)
            cap = (Categories.objects.all(), paginator.page(int(page)))
            return render(request, self.template_name, {'product_list': cap})

class WineView(generic.ListView):
    template_name = 'hrsapp/wine-list.html'
    context_object_name = 'product_list'

    def get(self, request, *args, **kwargs):
        if request.method == 'GET':
            page = request.GET.get('page')
            rated = request.GET.get('rated')
            delete = request.GET.get("delete")
            if page is None:
                page = 1
            if delete is not None:
                del request.session['rated']
            if rated is not None:
                current_rates = []
                all_rated = []
                if request.session.get('rated') is None:
                    current_rates.append(request.GET.get('rated'))
                    request.session['rated'] = current_rates
                    for inv_item in Inventory.objects.all():
                        if str(inv_item.id) in current_rates:
                            all_rated.append(inv_item)
                else:
                    current_rates = request.session['rated']
                    if request.GET.get('rated') not in current_rates:
                        current_rates.append(request.GET.get('rated'))
                        request.session['rated'] = current_rates
                    for inv_item in Inventory.objects.all():
                        print(current_rates)
                        if str(inv_item.id) in current_rates:
                            all_rated.append(inv_item)
                paginator = Paginator(Inventory.objects.all(), 42)
                contents = (Categories.objects.all(), paginator.page(int(page)), all_rated)
            else:
                paginator = Paginator(Inventory.objects.all(), 42)
                contents = (Categories.objects.all(), paginator.page(int(page)), 0)
            return render(request, self.template_name, {'product_list': contents})

class DetailView(generic.DetailView):
    model = Products
    template_name = 'hrsapp/detail.html'

class ResultsView(generic.DetailView):
    model = Products
    template_name = 'hrsapp/results.html'
