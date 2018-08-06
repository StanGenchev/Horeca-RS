from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.urls import reverse
from django.shortcuts import redirect
from django.views import generic
from django.core.paginator import EmptyPage, PageNotAnInteger, Paginator
from django.contrib.sessions.models import Session
from django.shortcuts import render
from django.http import HttpResponse
from django.db import connection

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
            
            prods = Inventory.objects.filter(in_stock = True).prefetch_related('product_id')
            u_rates = User_rates.objects.all().prefetch_related('product_id').prefetch_related('user_id')
            
            id_rates = {}
            for rate in current_rates:
                if prods.filter(product_id_id = rate[0]).exists():
                    id_rates[rate[0]] = rate[4]
            
            #print('\nID_RATES:\n')
            #print(id_rates)
            #print('\nUSER_ID:\n') 
                    
            user_id_rates = {}
            for rate in u_rates:
                if rate.product_id.id in id_rates.keys():
                    if rate.user_id.id in user_id_rates.keys():
                        user_id_rates[rate.user_id.id].append({rate.product_id.id: rate.rate})
                    else:
                        user_id_rates[rate.user_id.id] = [{rate.product_id.id: rate.rate}]

            """for user in user_id_rates:
                for item in user_id_rates[user]:
                    for sitem in item.keys():
                        if sitem in id_rates.keys():
                            print([user, {sitem: item[sitem]}])"""
            #print('\n')
            chisl = 0
            znam1 = 0
            znam2 = 0
            prod_rate = {}
            for user in sorted(user_id_rates.keys()):
                for item in user_id_rates[user]:
                    for key in item:
                        znam1 += id_rates[key]
                        chisl += id_rates[key] * item[key]
                        znam2 += item[key]
                        prod_rate[user] = chisl / ( math.sqrt(math.pow(znam1, 2)) * math.sqrt(math.pow(znam2, 2)) )
            print(prod_rate)
            
            paginator = Paginator(current_rates, 42)
            return render(request, self.template_name, {'contents': paginator.page(int(page))})

class WineView(generic.ListView):
    template_name = 'hrsapp/grid.html'

    def get(self, request, *args, **kwargs):
        if request.method == 'GET':
            page = request.GET.get('page')
            if page is None:
                page = 1
            paginator = Paginator(Inventory.objects.filter(in_stock = True), 42)
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
