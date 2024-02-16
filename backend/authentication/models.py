from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class UserProfile(models.Model):
    associated_user = models.ForeignKey(User, on_delete=models.CASCADE)
    billing_address = models.TextField(null=True)