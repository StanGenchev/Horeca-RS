from django.http import HttpResponseRedirect
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

import math
import numpy

class RequestsHandler(generic.ListView):

    def get(self, request, *args, **kwargs):
        if request.method == 'GET':
            rmrate = request.GET.get("rmrate")
            reset = request.GET.get("reset")
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
                        del current_rates[i]
                        request.session['rated'] = current_rates
                        break
                return redirect(url)
            elif reset is not None:
                Session.objects.all().delete()
                current_rates.clear()
                return redirect(url)

class IndexView(generic.ListView):
    template_name = 'hrsapp/index.html'

    def get(self, request, *args, **kwargs):
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
            rated = request.GET.get("rated")
            try:
                current_rates = request.session['rated']
            except:
                current_rates = []
            if page is None:
                page = 1
            if category is not None:
                request.session['category'] = category
                category_vendor_countries = []
                items = Products.objects.filter(category_id_id = int(category))
                for item in items:
                    idname = [int(item.vendor_id.region_id.country_id.id), item.vendor_id.region_id.country_id.name]
                    if idname not in category_vendor_countries:
                        category_vendor_countries.append(idname)
                contents = (0, 1, category_vendor_countries, current_rates, 'recommend-menu')
                return render(request, self.template_menu, {'contents': contents})
            elif country is not None:
                request.session['country'] = country
                category_id = int(request.session['category'])
                vendors_filterd = []
                items = Products.objects.filter(category_id_id = category_id, vendor_id__region_id__country_id_id = country)
                for item in items:
                    idname = [int(item.vendor_id.id), item.vendor_id.name]
                    if idname not in vendors_filterd:
                        vendors_filterd.append(idname)
                contents = (0, 0, vendors_filterd, current_rates, category_id)
                return render(request, self.template_menu, {'contents': contents})
            elif vendor is not None:
                request.session['vendor'] = vendor
                category_id = request.session['category']
                country_id = request.session['country']
                prods_filtered = Products.objects.filter(category_id_id = category_id, vendor_id_id = int(vendor), vendor_id__region_id__country_id_id = country_id)
                paginator = Paginator(prods_filtered, 42)
                contents = (paginator.page(int(page)), current_rates, country_id)
                return render(request, self.template_list, {'contents': contents})
            elif rated is not None:
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
                prods_filtered = Products.objects.filter(category_id_id = category, vendor_id_id = int(vendor))
                paginator = Paginator(prods_filtered, 42)
                contents = (paginator.page(int(page)), current_rates, country)
                return render(request, self.template_list, {'contents': contents})
            else:
                try:
                    contents = (1, 0, Categories.objects.all(), request.session['rated'], 'start')
                except:
                    contents = (1, 0, Categories.objects.all(), 0, 'start')
                return render(request, self.template_menu, {'contents': contents})

class GetRecommendView(generic.ListView):
    template_name = 'hrsapp/recommended.html'

    def get(self, request, *args, **kwargs):
        if request.method == 'GET':
            page = request.GET.get('page')
            try:
                current_rates = request.session['rated']
            except:
                current_rates = []
            if page is None:
                page = 1
            
            prods = Products.objects.all()
            all_rates = User_rates.objects.all()
            part1 = []
            part2 = []
            part3 = []
            part4 = []
            for prod in prods:
                aur_rate = 0
                a_avg_rate = 0
                ur_rate = 0
                avg_rate = 0
                for rate in current_rates:
                    a_avg_rate += rate[4]
                    if prod.id == rate[0]:
                        aur_rate = rate[4]
                for rate in all_rates:
                    avg_rate += rate.rate
                    if prod.id == rate.id:
                        ur_rate = rate.rate
                try:
                    a_avg_rate = a_avg_rate / len(current_rates)
                except:
                    a_avg_rate = 0
                part1.append(aur_rate - a_avg_rate)
                part3.append(pow((aur_rate - a_avg_rate), 2))
                try:
                    avg_rate = avg_rate / len(all_rates)
                except:
                    avg_rate = 0
                part2.append(ur_rate - avg_rate)
                part4.append(pow((ur_rate - avg_rate), 2))
            part1_final = sum(part1)
            part2_final = sum(part2)
            part3_final = math.sqrt(sum(part3))
            part4_final = math.sqrt(sum(part4))
            part1and2 = part1_final * part2_final
            part3and4 = part3_final * part4_final
            final = part1and2 / part3and4
            print(final)
            paginator = Paginator(current_rates, 42)
            return render(request, self.template_name, {'contents': paginator.page(int(page))})

class WineView(generic.ListView):
    template_name = 'hrsapp/grid.html'

    def get(self, request, *args, **kwargs):
        if request.method == 'GET':
            page = request.GET.get('page')
            if page is None:
                page = 1
            paginator = Paginator(Inventory.objects.all(), 42)
            return render(request, self.template_name, {'contents': paginator.page(int(page))})

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
                item = Products.objects.filter(id=int(wine))
                item = item[0]
                in_rates = 0
                for rate in current_rates:
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
                try:
                    item = Products.objects.filter(id=rated[0])
                    item = item[0]
                    in_rates = 0
                    for rate in current_rates:
                        if int(item.id) == int(rate[0]):
                            in_rates = rate[4]
                            break
                    contents = (item, in_rates, current_rates)
                except:
                    contents = (0, 0, current_rates)
                return render(request, self.template_name, {'contents': contents})
            else:
                return render(request, self.template_name, {'contents': 0})
