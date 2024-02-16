from rest_framework.response import Response
from rest_framework.decorators import api_view
from authentication.models import UserProfile
from product.models import Product

from .serializers import OrderItemSerializer, OrderSerializer

from .models import Order, OrderItem, OrderStatus

# Create your views here.
@api_view(["POST"])
def add_view(request):

    associated_user_profile_id = request.data["associated_user_profile"]
    date = request.data["date"]
    status = request.data["status"]
    total_amount = request.data["total_amount"]
    
    fields = [associated_user_profile_id, date, status, total_amount]    

    if "" in fields or None in fields:
        message = "All fields for the order must be given."
    elif len(status) > 255: 
        message = "Status cannot be longer than 255 characters."
    elif type(total_amount) != int or type(associated_user_profile_id) != int: 
        message = "Total amount and associated user profile id must be integers."
    else:
        status, created = OrderStatus.objects.get_or_create(name=status)
        associated_user_profile = UserProfile.objects.get(id=associated_user_profile_id)

        order = Order.objects.create(
            associated_user_profile=associated_user_profile, date=date, status=status, total_amount=total_amount
            )

        message = f"Order for {associated_user_profile.associated_user.username} successfully created."

    context = {"message": message}
    return Response(context)

@api_view(["PUT"])
def update_view(request, order_id):

    order = order.objects.get(id=order_id) 

    associated_user_profile_id = request.data["associated_user_profile"]
    date = request.data["date"]
    status = request.data["status"]
    total_amount = request.data["total_amount"]
    
    fields = [associated_user_profile_id, date, status, total_amount]    

    if "" in fields or None in fields:
        message = "All fields for the order must be given."
    elif len(status) > 255: 
        message = "Status cannot be longer than 255 characters."
    elif type(total_amount) != int or type(associated_user_profile_id) != int: 
        message = "Total amount and associated user profile id must be integers."
    else:
        status, created = OrderStatus.objects.get_or_create(name=status)
        associated_user_profile = UserProfile.objects.get(id=associated_user_profile_id)
 
        order.associated_user_profile = associated_user_profile
        order.date = date
        order.status = status
        order.total_amount = total_amount
        order.save()

        message = f"Order for {associated_user_profile.associated_user.username} successfully updated."

    context = {"message": message}
    return Response(context)

@api_view(["DELETE"])
def delete_view(request, order_id):

    order = Order.objects.get(id=order_id) 

    message = f"Order for {order.associated_user_profile.associated_user.username} successfully updated."

    order.delete()

    context = {"message": message}
    return Response(context)

@api_view(["GET"])
def orders_view(request):

    orders = Order.objects.all()
    order_serializer = OrderSerializer(orders, many=True)

    context = {order_serializer.data}
    return Response(context)

@api_view(["GET"])
def order_view(request, order_id):

    order = Order.objects.get(id=order_id) 
    order_serializer = OrderSerializer(order)

    context = {order_serializer.data}
    return Response(context)

@api_view(["POST"])
def add_item_view(request, order_id):

    associated_product_id = request.data["associated_product"]
    quantity = request.data["quantity"]
    
    fields = [associated_product_id, quantity]    

    if "" in fields or None in fields:
        message = "All fields for the order items must be given."
    elif type(quantity) != int or type(associated_product_id) != int: 
        message = "Quantity and Associated product id must be integers."
    else:
        associated_product = Product.objects.get(id=associated_product_id)
        associated_order = Order.objects.get(id=order_id)

        order_item = OrderItem.objects.create(
            associated_product=associated_product, associated_order=associated_order, quantity=quantity
        )

        message = f"Order Item of {associated_product.name} successfully created."

    context = {"message": message}
    return Response(context)

@api_view(["PUT"])
def update_item_view(request, order_item_id):

    order_item = OrderItem.objects.get(id=order_item_id)

    associated_product_id = request.data["associated_product"]
    quantity = request.data["quantity"]
    
    fields = [associated_product_id, quantity]    

    if "" in fields or None in fields:
        message = "All fields for the order items must be given."
    elif type(quantity) != int or type(associated_product_id) != int: 
        message = "Quantity and Associated product id must be integers."
    else:
        associated_product = Product.objects.get(id=associated_product_id)

        order_item.associated_product = associated_product
        order_item.quantity = quantity

        order_item.save()

        message = f"Order Item of {associated_product.name} successfully updated."

    context = {"message": message}
    return Response(context)

@api_view(["DELETE"])
def delete_item_view(request, order_item_id):

    order_item = OrderItem.objects.get(id=order_item_id)

    message = f"Order Item of {order_item.associated_product.name} successfully updated."

    order_item.delete()

    context = {"message": message}
    return Response(context)

@api_view(["GET"])
def order_items_view(request):

    order_items = OrderItem.objects.all()
    order_item_serializer = OrderItemSerializer(order_items, many=True)

    context = {order_item_serializer.data}
    return Response(context)

@api_view(["GET"])
def order_item_view(request, order_item_id):

    order_item = OrderItem.objects.get(id=order_item_id) 
    order_item_serializer = OrderItemSerializer(order_item)

    context = {order_item_serializer.data}
    return Response(context)

