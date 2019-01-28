from django.contrib import admin

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

admin.site.register(Appellation)
admin.site.register(Categories)
admin.site.register(Countries)
admin.site.register(Regions)
admin.site.register(Vendors)
admin.site.register(Products)
admin.site.register(Users)
admin.site.register(User_rates)
admin.site.register(Experts)
admin.site.register(Expert_rates)
admin.site.register(Inventory)
admin.site.register(Characteristics_headers)
admin.site.register(Characteristics_values)
admin.site.register(Expert_product_characteristic)
