from django.http import HttpResponseRedirect
from django.shortcuts import get_object_or_404
from django.shortcuts import render
from django.urls import reverse
from django.shortcuts import redirect
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

class RequestsHandler(generic.ListView):

    def get(self, request, *args, **kwargs):
        if request.method == 'GET':
            rmrate = request.GET.get("rmrate")
            url = request.GET.get("url")
            try:
                current_rates = request.session['rated']
            except:
                current_rates = []
            if rmrate is not None:
                in_rates = 0
                change_rate = 0
                for i, rate in enumerate(current_rates):
                    if int(rmrate) == rate[0]:
                        current_rates.pop(i)
                        request.session['rated'] = current_rates
                        break
                return redirect(url)

class IndexView(generic.ListView):
    template_name = 'hrsapp/index.html'

    def get(self, request, *args, **kwargs):
        if request.method == 'GET':
            delete = request.GET.get("delete")
            if delete is not None:
                Session.objects.all().delete()
        return render(request, self.template_name)

class RecommendView(generic.ListView):
    template_menu = 'hrsapp/recommend-menu.html'
    template_list = 'hrsapp/recommend-me-list.html'

    def get(self, request, *args, **kwargs):
        if request.method == 'GET':
            page = request.GET.get('page')
            category = request.GET.get('category')
            country = request.GET.get('country')
            vendor = request.GET.get('vendor')
            delete = request.GET.get("delete")
            rated = request.GET.get("rated")
            prods = Products.objects.all()
            try:
                current_rates = request.session['rated']
            except:
                current_rates = []
            if page is None:
                page = 1
            if delete is not None:
                Session.objects.all().delete()
                current_rates.clear()
                contents = (1, 0, Categories.objects.all(), current_rates, 'start')
                return render(request, self.template_menu, {'contents': contents})
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
                contents = (0, 1, category_countries, current_rates, 'recommend-menu')
                return render(request, self.template_menu, {'contents': contents})
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
                contents = (0, 0, vendors_filterd, current_rates, category_id)
                return render(request, self.template_menu, {'contents': contents})
            elif vendor is not None:
                request.session['vendor'] = vendor
                category = request.session['category']
                country = request.session['country']
                prods_filtered = []
                for prod in prods:
                    if int(prod.category_id.id) == int(category):
                        if int(prod.vendor_id.id) == int(vendor):
                            prods_filtered.append(prod)
                paginator = Paginator(prods_filtered, 42)
                contents = (paginator.page(int(page)), current_rates, country)
                return render(request, self.template_list, {'contents': contents})
            elif rated is not None:
                prods_filtered = []
                vendor = request.session['vendor']
                category = request.session['category']
                country = request.session['country']
                rated = str(rated).split('<hrs>')
                rated[0] = int(rated[0])
                rated[4] = int(rated[4])
                in_rates = 0
                change_rate = 0
                for i, rate in enumerate(current_rates):
                    if rated[0] == rate[0]:
                        if rated[4] == rate[4]:
                            in_rates = 1
                            break
                        else:
                            current_rates[i][4] = rated[4]
                            request.session['rated'] = current_rates
                            change_rate = 1
                            break
                if in_rates == 0:
                    if change_rate == 0:
                        current_rates.insert(0, rated)
                        request.session['rated'] = current_rates
                for prod in prods:
                    if int(prod.category_id.id) == int(category):
                        if int(prod.vendor_id.id) == int(vendor):
                            prods_filtered.append(prod)
                paginator = Paginator(prods_filtered, 42)
                contents = (paginator.page(int(page)), current_rates, country)
                return render(request, self.template_list, {'contents': contents})
            else:
                try:
                    contents = (1, 0, Categories.objects.all(), request.session['rated'], 'start')
                except:
                    contents = (1, 0, Categories.objects.all(), 0, 'start')
                return render(request, self.template_menu, {'contents': contents})

class WineView(generic.ListView):
    template_name = 'hrsapp/grid.html'

    def get(self, request, *args, **kwargs):
        if request.method == 'GET':
            page = request.GET.get('page')
            delete = request.GET.get("delete")
            try:
                current_rates = request.session['rated']
            except:
                current_rates = []
            if page is None:
                page = 1
            if delete is not None:
                Session.objects.all().delete()
                current_rates.clear()
            paginator = Paginator(Inventory.objects.all(), 42)
            contents = (paginator.page(int(page)), current_rates)
            return render(request, self.template_name, {'contents': contents})

class DetailView(generic.ListView):
    template_name = 'hrsapp/detail.html'

    def get(self, request, *args, **kwargs):
        if request.method == 'GET':
            wine = request.GET.get('wine')
            rated = request.GET.get("rated")
            try:
                current_rates = request.session['rated']
            except:
                current_rates = []
            if wine is not None:
                for item in Products.objects.all():
                    if int(item.id) == int(wine):
                        in_rates = 0
                        for i, rate in enumerate(current_rates):
                            if int(item.id) == int(rate[0]):
                                in_rates = rate[4]
                                break
                        contents = (item, in_rates, current_rates)
                        return render(request, self.template_name, {'contents': contents})
            elif rated is not None:
                rated = str(rated).split('<hrs>')
                rated[0] = int(rated[0])
                rated[4] = int(rated[4])
                in_rates = 0
                change_rate = 0
                for i, rate in enumerate(current_rates):
                    if rated[0] == rate[0]:
                        if rated[4] == rate[4]:
                            in_rates = 1
                            break
                        else:
                            current_rates[i][4] = rated[4]
                            request.session['rated'] = current_rates
                            change_rate = 1
                            break
                if in_rates == 0:
                    if change_rate == 0:
                        current_rates.insert(0, rated)
                        request.session['rated'] = current_rates
                for item in Products.objects.all():
                    if int(item.id) == rated[0]:
                        in_rates = 0
                        for i, rate in enumerate(current_rates):
                            if int(item.id) == rate[0]:
                                in_rates = rate[4]
                                break
                        contents = (item, in_rates, current_rates)
                        return render(request, self.template_name, {'contents': contents})
            else:
                return render(request, self.template_name, {'contents': 0})
