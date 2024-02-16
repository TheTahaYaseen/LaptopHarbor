from django.db import models

# Create your models here.
class TransactionStatus(models.Model):
    name = models.CharField(max_length=255)

class TransactionPaymentMethod(models.Model):
    name = models.CharField(max_length=255)

class Transaction(models.Model):
    associated_order = models.ForeignKey("order.Order", on_delete=models.CASCADE)
    date = models.DateTimeField()
    amount = models.IntegerField()
    payment_method = models.ForeignKey(TransactionPaymentMethod, on_delete=models.SET_NULL, null=True)
    status = models.ForeignKey(TransactionStatus, on_delete=models.SET_NULL, null=True)
