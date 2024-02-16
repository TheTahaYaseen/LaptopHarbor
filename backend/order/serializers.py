from rest_framework import serializers

from .models import Order, OrderItem

class OrderSerializer(serializers.ModelSerializer):
    class Meta:
        model = Order
        fields = ["id", "associated_user_profile_id", "date", "status", "total_amount"]    

class OrderItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = OrderItem
        fields = ["id", "associated_order", "associated_product", "quantity"]    