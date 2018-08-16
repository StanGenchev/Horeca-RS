from django.db import models

class Appellation(models.Model):
    name = models.TextField()
    region_id = models.ForeignKey('Regions', on_delete = models.SET_DEFAULT, default = 0)
    
    def __str__(self):
        return self.name

    class Meta:
      db_table = "appellation"

class Categories(models.Model):
    name = models.TextField()
    description = models.TextField()
    
    def __str__(self):
        return self.name

    class Meta:
      db_table = "categories"

class Countries(models.Model):
    name = models.TextField()
    
    def __str__(self):
        return self.name

    class Meta:
      db_table = "countries"

class Regions(models.Model):
    name = models.TextField()
    country_id = models.ForeignKey('Countries', on_delete = models.SET_DEFAULT, default = 0)
    
    def __str__(self):
        return self.name

    class Meta:
      db_table = "regions"

class Vendors(models.Model):
    name = models.TextField()
    description = models.TextField()
    region_id = models.ForeignKey('Regions', on_delete = models.SET_DEFAULT, default = 0)
    
    def __str__(self):
        return self.name

    class Meta:
      db_table = "vendors"

class Products(models.Model):
    name = models.TextField()
    description = models.TextField()
    vendor_id = models.ForeignKey('Vendors', on_delete = models.SET_DEFAULT, default = 0)
    category_id = models.ForeignKey('Categories', on_delete = models.SET_DEFAULT, default = 0)
    appellation_id = models.ForeignKey('Appellation', on_delete = models.SET_DEFAULT, default = 0)
    photo_path = models.TextField()
    
    def __str__(self):
        return self.name

    class Meta:
      db_table = "products"

class Users(models.Model):
    email = models.TextField(unique=True)
    avatar = models.TextField()
    first_name = models.TextField()
    last_name = models.TextField()
    
    def __str__(self):
        return self.email
    
    class Meta:
      db_table = "users"

class User_rates(models.Model):
    user_id = models.ForeignKey('Users', on_delete = models.SET_DEFAULT, default = 0)
    product_id = models.ForeignKey('Products', on_delete = models.SET_DEFAULT, default = 0)
    rate = models.IntegerField(default = 0)
    comment = models.TextField()
    
    def __str__(self):
        return self.rate

    class Meta:
      db_table = "user_rates"

class Experts(models.Model):
    email = models.TextField(unique=True)
    avatar = models.TextField()
    first_name = models.TextField()
    last_name = models.TextField()
    
    def __str__(self):
        return self.email
    
    class Meta:
      db_table = "experts"

class Expert_rates(models.Model):
    expert_id = models.ForeignKey('Experts', on_delete = models.SET_DEFAULT, default = 0)
    product_id = models.ForeignKey('Products', on_delete = models.SET_DEFAULT, default = 0)
    rate = models.IntegerField(default = 0)
    comment = models.TextField()
    
    def __str__(self):
        return self.rate

    class Meta:
      db_table = "expert_rates"

class Inventory(models.Model):
    product_id = models.ForeignKey('Products', on_delete = models.SET_DEFAULT, default = 0)
    in_stock = models.BooleanField(default = True)
    price = models.DecimalField(max_digits=6, decimal_places=2, default = 12.95)
    
    def __int_(self):
        return self.id

    class Meta:
      db_table = "inventory"

class Characteristics_headers(models.Model):
    name = models.TextField()
    description = models.TextField()
    min_value = models.IntegerField(default = 0)
    max_value = models.IntegerField(default = 5)
    
    def __str__(self):
        return self.name

    class Meta:
      db_table = "characteristics_headers"

class Characteristics_values(models.Model):
    name = models.TextField()
    value = models.IntegerField(default = 0)
    c_header_id = models.ForeignKey('Characteristics_headers', on_delete = models.SET_DEFAULT, default = 0)
    
    def __str__(self):
        return self.name

    class Meta:
      db_table = "characteristics_values"

class Expert_product_characteristic(models.Model):
    c_header_id = models.ForeignKey('Characteristics_headers', on_delete = models.SET_DEFAULT, default = 0)
    product_id = models.ForeignKey('Products', on_delete = models.SET_DEFAULT, default = 0)
    expert_id = models.ForeignKey('Experts', on_delete = models.SET_DEFAULT, default = 0)
    characteristic_values = models.IntegerField(default = 0)
    
    def __str__(self):
        return self.c_header_id

    class Meta:
      db_table = "expert_product_characteristic"
