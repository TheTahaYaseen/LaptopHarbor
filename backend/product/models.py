from django.db import models

# Create your models here.

class ProductCategory(models.Model):
    name = models.CharField(max_length=255)
    # description = models.TextField()

class ProductBrand(models.Model):
    name = models.CharField(max_length=255)
    # description = models.TextField()

class Product(models.Model):
    name = models.CharField(max_length=255)
    description = models.TextField()
    price = models.IntegerField()
    category = models.ForeignKey(ProductCategory, on_delete=models.SET_NULL, null=True)
    brand = models.ForeignKey(ProductBrand, on_delete=models.SET_NULL, null=True)
    units_in_stock = models.IntegerField()
    image = models.ImageField()