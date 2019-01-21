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
from render_block import render_block_to_string

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

def requests(request):
    if request.method == 'GET':
        rmrate = request.GET.get("rmrate")
        reset = request.GET.get("reset")
        url = request.GET.get("url")
        try:
            current_rates = request.session['rated']
        except:
            current_rates = []
        if "?rated=" in url:
                url = url.split("?rated=")
                url = url[0] + "?vendor=" + request.session['vendor']
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

def home(request):
    return render(request, 'hrsapp/partials/home-content.html')

def recommend_navigation(request):
    template_menu = 'hrsapp/partials/recommend-nav.html'
    template_list = 'hrsapp/partials/recommend-me-list.html'

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
            items = Products.objects.filter(category_id_id = int(category)).prefetch_related('vendor_id').prefetch_related('category_id')
            for item in items:
                idname = [int(item.vendor_id.region_id.country_id.id), item.vendor_id.region_id.country_id.name]
                if idname not in category_vendor_countries:
                    category_vendor_countries.append(idname)
            contents = (0, 1, category_vendor_countries, current_rates, 'recommend-menu')
            return render(request, template_menu, {'contents': contents})
        elif country is not None:
            request.session['country'] = country
            category_id = int(request.session['category'])
            vendors_filterd = []
            items = Products.objects.filter(category_id_id = category_id, vendor_id__region_id__country_id_id = country).prefetch_related('vendor_id').prefetch_related('category_id')
            for item in items:
                idname = [int(item.vendor_id.id), item.vendor_id.name]
                if idname not in vendors_filterd:
                    vendors_filterd.append(idname)
            contents = (0, 0, vendors_filterd, current_rates, category_id)
            return render(request, template_menu, {'contents': contents})
        elif vendor is not None:
            request.session['vendor'] = vendor
            category_id = request.session['category']
            country_id = request.session['country']
            prods_filtered = Products.objects.filter(category_id_id = category_id, vendor_id_id = int(vendor), vendor_id__region_id__country_id_id = country_id).prefetch_related('vendor_id').prefetch_related('category_id')
            paginator = Paginator(prods_filtered, 40)
            contents = (paginator.page(int(page)), current_rates, country_id)
            return render(request, template_list, {'contents': contents})
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
            prods_filtered = Products.objects.filter(category_id_id = category, vendor_id_id = int(vendor)).prefetch_related('vendor_id').prefetch_related('category_id')
            paginator = Paginator(prods_filtered, 40)
            contents = (paginator.page(int(page)), current_rates, country)
            return render(request, template_list, {'contents': contents})
        else:
            try:
                contents = (1, 0, Categories.objects.all(), request.session['rated'], 'start')
            except:
                contents = (1, 0, Categories.objects.all(), 0, 'start')
            return render(request, template_menu, {'contents': contents})

def recommended_view(request):
    template_name = 'hrsapp/partials/recommended.html'
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

        user_id_rates = {}

        for rate in u_rates:
            if rate.product_id.id in id_rates.keys():
                if rate.user_id.id in user_id_rates.keys():
                    user_id_rates[rate.user_id.id].append({rate.product_id.id: rate.rate})
                else:
                    user_id_rates[rate.user_id.id] = [{rate.product_id.id: rate.rate}]

        numerator = 0
        denominator1 = 0
        denominator2 = 0
        prod_rate = {}
        for user in sorted(user_id_rates.keys()):
            for item in user_id_rates[user]:
                for key in item:
                    denominator1 += id_rates[key]
                    numerator += id_rates[key] * item[key]
                    denominator2 += item[key]
                    prod_rate[user] = numerator / (math.sqrt(math.pow(denominator1, 2)) * math.sqrt(math.pow(denominator2, 2)))

        recommended_prods_raw = {}
        recommended_prods = []

        for item in u_rates:
            if item.user_id.id in prod_rate.keys() and item.product_id.id not in id_rates.keys():
                rate = item.rate * prod_rate[item.user_id.id]
                if rate >= 1:
                    if item.product_id.id in recommended_prods_raw.keys():
                        recommended_prods_raw[item.product_id.id] = [item.product_id, item.product_id.vendor_id, item.product_id.category_id, item.product_id.photo_path, recommended_prods_raw[item.product_id.id][4] + rate, recommended_prods_raw[item.product_id.id][5] + 1]
                    else:
                        recommended_prods_raw[item.product_id.id] = [item.product_id, item.product_id.vendor_id, item.product_id.category_id, item.product_id.photo_path, rate, 1]

        for i in recommended_prods_raw:
            recommended_prods.append([i, recommended_prods_raw[i][0], recommended_prods_raw[i][1], recommended_prods_raw[i][2], recommended_prods_raw[i][3], round(recommended_prods_raw[i][4] / recommended_prods_raw[i][5], 1)])
        recommended_prods = sorted(recommended_prods, key=lambda x: x[5], reverse=True)

        paginator = Paginator(recommended_prods, 40)
        return render(request, template_name, {'contents': paginator.page(int(page))})

def wines(request):
    if request.method == 'GET':
        page = request.GET.get('page', 1)
        minimal = request.GET.get('return', None)

        paginator = Paginator(Inventory.objects.filter(in_stock = True).prefetch_related('product_id'), 40)
        try:
            content = paginator.page(page)
        except PageNotAnInteger:
            content = paginator.page(1)
        except EmptyPage:
            content = paginator.page(paginator.num_pages)

        if not minimal:
            return render(request, 'hrsapp/partials/items-view.html', {'contents': content})
        return HttpResponse(render_block_to_string('hrsapp/partials/items-view.html', 'content', {'contents': content}))

def details(request, wine_id):
    template_name = 'hrsapp/partials/detail.html'

    if request.method == 'GET':
        if wine_id is not None:
            selected_wine = Products.objects.get(id = wine_id)
            prod_chars = Expert_product_characteristic.objects.filter(product_id_id = wine_id)

            prod_chars_list = [0, 0, 0, 0, 0, 0]

            for char in prod_chars:
                if char.c_header_id.id == 1:
                    prod_chars_list[0] += char.characteristic_values
                elif char.c_header_id.id == 2:
                    prod_chars_list[1] += char.characteristic_values
                elif char.c_header_id.id == 3:
                    prod_chars_list[2] += char.characteristic_values
                elif char.c_header_id.id == 4:
                    prod_chars_list[3] += char.characteristic_values
                else:
                    prod_chars_list[4] += char.characteristic_values
                prod_chars_list[5] += 1

            prod_chars_list[5] = prod_chars_list[5]/5

            for char in prod_chars_list:
                prod_chars_list[0] = int(prod_chars_list[0]/prod_chars_list[5])
                prod_chars_list[1] = int(prod_chars_list[1]/prod_chars_list[5])
                prod_chars_list[2] = int(prod_chars_list[2]/prod_chars_list[5])
                prod_chars_list[3] = int(prod_chars_list[3]/prod_chars_list[5])
                prod_chars_list[4] = int(prod_chars_list[4]/prod_chars_list[5])

            u_rates = User_rates.objects.prefetch_related('product_id').prefetch_related('user_id').filter(product_id__category_id = selected_wine.category_id)
            e_rates = Expert_rates.objects.prefetch_related('product_id').prefetch_related('expert_id').filter(product_id__category_id = selected_wine.category_id)

            active_product_user_rates = u_rates.filter(product_id_id = selected_wine.id)
            active_product_expert_rates = e_rates.filter(product_id_id = selected_wine.id)
            #active_product_users = active_product_user_rates.values_list('user_id', flat = True)

            user_rates_selected_rates = {}
            expert_rates_selected_rates = {}

            numerator = 0
            denominator1 = 0
            denominator2 = 0
            active_item_user_rates = [0, 0]

            for rate in active_product_user_rates:
                active_item_user_rates[0] += rate.rate
                active_item_user_rates[1] += 1
                for item in u_rates.filter(user_id = rate.user_id.id):
                    if item.product_id.id != selected_wine.id:
                        denominator1 += rate.rate
                        numerator += rate.rate * item.rate
                        denominator2 += item.rate
                        user_rates_selected_rates[item.product_id.id] = [item.product_id.name, item.product_id.vendor_id, item.product_id.photo_path, numerator / (math.sqrt(math.pow(denominator1, 2)) * math.sqrt(math.pow(denominator2, 2)))]

            user_sililar_prods_raw = {}

            for item in u_rates:
                if item.user_id.id in user_rates_selected_rates.keys():
                    rate = item.rate * user_rates_selected_rates[item.user_id.id][3]
                    if rate >= 1:
                        if item.product_id.id in user_sililar_prods_raw.keys():
                            user_sililar_prods_raw[item.product_id.id] = [item.product_id, item.product_id.vendor_id, item.product_id.category_id, item.product_id.photo_path, user_sililar_prods_raw[item.product_id.id][4] + rate, user_sililar_prods_raw[item.product_id.id][5] + 1]
                        else:
                            user_sililar_prods_raw[item.product_id.id] = [item.product_id, item.product_id.vendor_id, item.product_id.category_id, item.product_id.photo_path, rate, 1]
                    else:
                        if item.product_id.id in user_sililar_prods_raw.keys():
                            user_sililar_prods_raw[item.product_id.id] = [item.product_id, item.product_id.vendor_id, item.product_id.category_id, item.product_id.photo_path, user_sililar_prods_raw[item.product_id.id][4] + 1, user_sililar_prods_raw[item.product_id.id][5] + 1]
                        else:
                            user_sililar_prods_raw[item.product_id.id] = [item.product_id, item.product_id.vendor_id, item.product_id.category_id, item.product_id.photo_path, 1, 1]

            numerator = 0
            denominator1 = 0
            denominator2 = 0
            active_item_expert_rates = [0, 0]

            for rate in active_product_expert_rates:
                active_item_expert_rates[0] += rate.rate
                active_item_expert_rates[1] += 1
                for item in e_rates.filter(expert_id = rate.expert_id.id):
                    if item.product_id.id != selected_wine.id:
                        denominator1 += rate.rate
                        numerator += rate.rate * item.rate
                        denominator2 += item.rate
                        expert_rates_selected_rates[item.product_id.id] = [item.product_id.name, item.product_id.vendor_id, item.product_id.photo_path, numerator / (math.sqrt(math.pow(denominator1, 2)) * math.sqrt(math.pow(denominator2, 2)))]

            expert_sililar_prods_raw = {}

            for item in u_rates:
                if item.user_id.id in expert_rates_selected_rates.keys():
                    rate = item.rate * expert_rates_selected_rates[item.user_id.id][3]
                    if rate >= 1:
                        if item.product_id.id in expert_sililar_prods_raw.keys():
                            expert_sililar_prods_raw[item.product_id.id] = [item.product_id, item.product_id.vendor_id, item.product_id.category_id, item.product_id.photo_path, expert_sililar_prods_raw[item.product_id.id][4] + rate, expert_sililar_prods_raw[item.product_id.id][5] + 1]
                        else:
                            expert_sililar_prods_raw[item.product_id.id] = [item.product_id, item.product_id.vendor_id, item.product_id.category_id, item.product_id.photo_path, rate, 1]
                    else:
                        if item.product_id.id in expert_sililar_prods_raw.keys():
                            expert_sililar_prods_raw[item.product_id.id] = [item.product_id, item.product_id.vendor_id, item.product_id.category_id, item.product_id.photo_path, expert_sililar_prods_raw[item.product_id.id][4] + 1, expert_sililar_prods_raw[item.product_id.id][5] + 1]
                        else:
                            expert_sililar_prods_raw[item.product_id.id] = [item.product_id, item.product_id.vendor_id, item.product_id.category_id, item.product_id.photo_path, 1, 1]

            user_sililar_prods = []
            expert_sililar_prods = []

            for item in user_sililar_prods_raw:
                user_sililar_prods.append([item, user_sililar_prods_raw[item][0], user_sililar_prods_raw[item][1], user_sililar_prods_raw[item][2], user_sililar_prods_raw[item][3], round(user_sililar_prods_raw[item][4] / user_sililar_prods_raw[item][5], 1)])

            for item in expert_sililar_prods_raw:
                expert_sililar_prods.append([item, expert_sililar_prods_raw[item][0], expert_sililar_prods_raw[item][1], expert_sililar_prods_raw[item][2], expert_sililar_prods_raw[item][3], round(expert_sililar_prods_raw[item][4] / expert_sililar_prods_raw[item][5], 1)])

            user_sililar_prods = sorted(user_sililar_prods, key=lambda x: x[5], reverse=True)
            expert_sililar_prods = sorted(expert_sililar_prods, key=lambda x: x[5], reverse=True)
            if len(user_sililar_prods) > 30:
                user_sililar_prods = user_sililar_prods[:30]
            if len(expert_sililar_prods) > 30:
                expert_sililar_prods = expert_sililar_prods[:30]

            active_item_avg_rate = [math.ceil(active_item_user_rates[0]/active_item_user_rates[1]), math.ceil(active_item_expert_rates[0]/active_item_expert_rates[1])]

            contents = (selected_wine, active_item_avg_rate, user_sililar_prods, expert_sililar_prods, prod_chars_list)
            return render(request, template_name, {'contents': contents})
        else:
            return render(request, template_name, {'contents': 0})
