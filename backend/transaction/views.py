from django.shortcuts import render

# Create your views here.
from rest_framework.response import Response
from rest_framework.decorators import api_view

# Create your views here.
@api_view(["POST"])
def add_view(request):

    message = "add transaction."

    context = {"message": message}
    return Response(context)

@api_view(["PUT"])
def update_view(request):

    message = "update transaction."

    context = {"message": message}
    return Response(context)

@api_view(["DELETE"])
def delete_view(request):

    message = "delete transaction."

    context = {"message": message}
    return Response(context)

@api_view(["GET"])
def transactions_view(request):

    message = "transactions transaction."

    context = {"message": message}
    return Response(context)

@api_view(["GET"])
def transaction_view(request):

    message = "transaction transaction."

    context = {"message": message}
    return Response(context)

