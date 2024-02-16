from django.db import models
from django.contrib.auth.models import User
from authentication.models import UserProfile

# Create your models here.
class OrderStatus(models.Model):
    name = models.CharField(max_length=255)

class Order(models.Model):
    associated_user_profile = models.ForeignKey("authentication.UserProfile", on_delete=models.CASCADE)
    date = models.DateTimeField()
    status = models.ForeignKey(OrderStatus, on_delete=models.SET_NULL, null=True)
    total_amount = models.IntegerField()

class OrderItem(models.Model):
    associated_order = models.ForeignKey(Order, on_delete=models.CASCADE)
    associated_product = models.ForeignKey("product.Product", on_delete=models.CASCADE)
    quantity = models.IntegerField()