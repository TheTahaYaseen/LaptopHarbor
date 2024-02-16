from rest_framework.response import Response
from rest_framework.decorators import api_view

# Create your views here.
@api_view(["POST"])
def add_view(request):

    message = "add order."

    context = {"message": message}
    return Response(context)

@api_view(["PUT"])
def update_view(request):

    message = "update order."

    context = {"message": message}
    return Response(context)

@api_view(["DELETE"])
def delete_view(request):

    message = "delete order."

    context = {"message": message}
    return Response(context)

@api_view(["GET"])
def orders_view(request):

    message = "orders order."

    context = {"message": message}
    return Response(context)

@api_view(["GET"])
def order_view(request):

    message = "order order."

    context = {"message": message}
    return Response(context)

