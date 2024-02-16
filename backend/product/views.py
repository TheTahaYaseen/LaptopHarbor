from rest_framework.response import Response
from rest_framework.decorators import api_view

# Create your views here.
@api_view(["POST"])
def add_view(request):

    message = "add product."

    context = {"message": message}
    return Response(context)

@api_view(["PUT"])
def update_view(request):

    message = "update product."

    context = {"message": message}
    return Response(context)

@api_view(["DELETE"])
def delete_view(request):

    message = "delete product."

    context = {"message": message}
    return Response(context)

@api_view(["GET"])
def products_view(request):

    message = "products product."

    context = {"message": message}
    return Response(context)

@api_view(["GET"])
def product_view(request):

    message = "product product."

    context = {"message": message}
    return Response(context)

