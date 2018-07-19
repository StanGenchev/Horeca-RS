from django.http import HttpResponseRedirect
from django.shortcuts import get_object_or_404
from django.shortcuts import render
from django.urls import reverse
from django.views import generic
from django.core.paginator import EmptyPage, PageNotAnInteger, Paginator
from django.contrib.sessions.models import Session
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
            clear_recommend = request.GET.get("clear-recommend")
            rated = request.GET.get("rated")
            prods = Products.objects.all()
            if page is None:
                page = 1
            if delete is not None:
                Session.objects.all().delete()
                menu_objects = (1, 0, 0, 0, Categories.objects.all())
                return render(request, self.template_name, {'menu_objects': menu_objects})
            elif clear_recommend is not None:
                try:
                    del request.session['category']
                    del request.session['country']
                    del request.session['vendor']
                    menu_objects = (1, 0, 0, 0, Categories.objects.all())
                    return render(request, self.template_name, {'menu_objects': menu_objects})
                except:
                    menu_objects = (1, 0, 0, 0, Categories.objects.all())
                    return render(request, self.template_name, {'menu_objects': menu_objects})
            elif category is not None:
                request.session['category'] = category
                category_vendor_countries = []
                category_countries = []
                all_countries = Countries.objects.all()
                for prod in prods:
                    if int(prod.category_id.id) == int(category):
                        if int(prod.vendor_id.region_id.country_id.id) not in category_vendor_countries:
                            category_vendor_countries.append(int(prod.vendor_id.region_id.country_id.id))
                for vendor_country_id in category_vendor_countries:
                    for category_country in all_countries:
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
                vends = Vendors.objects.all()
                for prod in prods:
                    if int(prod.category_id.id) == category_id:
                        if int(prod.vendor_id.id) not in category_vendor_ids:
                            category_vendor_ids.append(int(prod.vendor_id.id))
                for vend in vends:
                    if int(vend.region_id.country_id.id) == int(country) and int(vend.id) in category_vendor_ids:
                        vendors_filterd.append(vend)
                menu_objects = (0, 0, 1, 0, vendors_filterd)
                return render(request, self.template_name, {'menu_objects': menu_objects})
            elif vendor is not None:
                request.session['vendor'] = vendor
                category = request.session['category']
                country = request.session['country']
                prods_filtered = []
                current_rates = []
                try:
                    current_rates = request.session['rated']
                    print(current_rates)
                    for prod in prods:
                        if int(prod.category_id.id) == int(category):
                            if int(prod.vendor_id.id) == int(vendor):
                                prods_filtered.append(prod)
                    paginator = Paginator(prods_filtered, 42)
                    contents = (Categories.objects.all(), paginator.page(int(page)), current_rates)
                except:
                    for prod in prods:
                        if int(prod.category_id.id) == int(category):
                            if int(prod.vendor_id.id) == int(vendor):
                                prods_filtered.append(prod)
                    paginator = Paginator(prods_filtered, 42)
                    contents = (Categories.objects.all(), paginator.page(int(page)), 0)
                return render(request, 'hrsapp/recommend-list.html', {'product_list': contents})
            else:
                try:
                    current_rates = []
                    prods_filtered = []
                    vendor = request.session['vendor']
                    category = request.session['category']
                    country = request.session['country']
                    try:
                        current_rates = request.session['rated']
                        print(current_rates)
                    except:
                        pass
                    if rated is not None:
                        rated = str(rated).split('<hrs>')
                        in_rates = 0
                        for rate in current_rates:
                            if str(rated[0]) == str(rate[0]):
                                in_rates = 1
                                break
                        if in_rates == 0:
                            current_rates.append(rated)
                            request.session['rated'] = current_rates
                    for prod in prods:
                        if int(prod.category_id.id) == int(category):
                            if int(prod.vendor_id.id) == int(vendor):
                                prods_filtered.append(prod)
                    paginator = Paginator(prods_filtered, 42)
                    contents = (Categories.objects.all(), paginator.page(int(page)), current_rates)
                    return render(request, 'hrsapp/recommend-list.html', {'product_list': contents})
                except:
                    menu_objects = (1, 0, 0, 0, Categories.objects.all())
                    return render(request, self.template_name, {'menu_objects': menu_objects})

class WineView(generic.ListView):
    template_name = 'hrsapp/wine-list.html'
    context_object_name = 'product_list'

    def get(self, request, *args, **kwargs):
        if request.method == 'GET':
            page = request.GET.get('page')
            delete = request.GET.get("delete")
            clear_recommend = request.GET.get("clear-recommend")
            if page is None:
                page = 1
            if delete is not None:
                Session.objects.all().delete()
            elif clear_recommend is not None:
                try:
                    del request.session['category']
                    del request.session['country']
                    del request.session['vendor']
                    paginator = Paginator(Inventory.objects.all(), 42)
                    contents = (Categories.objects.all(), paginator.page(int(page)), 0)
                except:
                    paginator = Paginator(Inventory.objects.all(), 42)
                    contents = (Categories.objects.all(), paginator.page(int(page)), 0)
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
