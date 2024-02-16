from django.shortcuts import render

# Create your views here.
from django.contrib.auth import authenticate
from django.contrib.auth.models import User

from rest_framework.response import Response
from rest_framework.decorators import api_view

from .models import UserProfile


# Create your views here.
@api_view(["POST"])
def register_view(request):
    username = request.data["username"]
    password = request.data["password"]

    if username and password:
        if len(password) < 8:
            message = "Password must be longer than 8 characters!"
        else:
            try:
                user = User.objects.get(username=username)
                message = "User with username already exists"
            except User.DoesNotExist:
                user = User.objects.create_user(username=username, password=password)
                user_profile = UserProfile.objects.create(associated_user=user, billing_address=None) 
                message = "User registered and logged in!"
    else:
        message = "Username and password must be given!"

    context = {"message": message}
    return Response(context)

@api_view(["POST"])
def login_view(request):

    username = request.data["username"]
    password = request.data["password"]

    if username and password:
        try:
            user = User.objects.get(username=username)
            user = authenticate(request=request, username=username, password=password)

            if user is not None:
                message = "User logged in!"
            else: 
                message = "Incorrect credentials given!"

        except User.DoesNotExist:
            message = "User with username doesn't exist!"
    else:
        message = "Username and password must be given!"


    context = {"message": message}
    return Response(context)
    