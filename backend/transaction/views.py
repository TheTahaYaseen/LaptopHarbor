from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import Transaction, TransactionPaymentMethod, TransactionStatus

from .serializers import TransactionSerializer

from order.models import Order

# Create your views here.
@api_view(["POST"])
def add_view(request):

    associated_order_id = request.data["associated_order"]
    date = request.data["date"]
    amount = request.data["amount"]
    payment_method = request.data["payment_method"]
    status = request.data["status"]
    
    fields = [associated_order_id, date, amount, payment_method, status]    

    if "" in fields or None in fields:
        message = "All fields for the order must be given."
    elif len(status) > 255 or len(payment_method) > 255: 
        message = "Status or Payment method cannot be longer than 255 characters."
    elif type(amount) != int or type(associated_order_id) != int: 
        message = "Amount and associated order id must be integers."
    else:
        status, created = TransactionStatus.objects.get_or_create(name=status)
        associated_order = Order.objects.get(id=associated_order_id)
        payment_method = TransactionPaymentMethod.objects.get_or_create(name=payment_method)

        transaction = Transaction.objects.create(
            associated_order=associated_order, date=date, status=status, amount=amount, payment_method=payment_method
            )

        message = f"Transaction for {associated_order.associated_user_profile.associated_user.username} successfully created."

    context = {"message": message}
    return Response(context)

@api_view(["PUT"])
def update_view(request, transaction_id):

    transaction = transaction.objects.get(id=transaction_id) 

    associated_order_id = request.data["associated_order"]
    date = request.data["date"]
    amount = request.data["amount"]
    payment_method = request.data["payment_method"]
    status = request.data["status"]
    
    fields = [associated_order_id, date, amount, payment_method, status]    

    if "" in fields or None in fields:
        message = "All fields for the order must be given."
    elif len(status) > 255 or len(payment_method) > 255: 
        message = "Status or Payment method cannot be longer than 255 characters."
    elif type(amount) != int or type(associated_order_id) != int: 
        message = "Amount and associated order id must be integers."
    else:
        status, created = TransactionStatus.objects.get_or_create(name=status)
        associated_order = Order.objects.get(id=associated_order_id)
        payment_method = TransactionPaymentMethod.objects.get_or_create(name=payment_method)
    
        transaction.associated_order=associated_order 
        transaction.date=date 
        transaction.status=status 
        transaction.amount=amount 
        transaction.payment_method=payment_method

        transaction.save()

        message = f"Transaction for {associated_order.associated_user_profile.associated_user.username} successfully updated."

    context = {"message": message}
    return Response(context)

@api_view(["DELETE"])
def delete_view(request, transaction_id):

    transaction = Order.objects.get(id=transaction_id) 

    message = f"Transaction for {transaction.associated_order.associated_user_profile.associated_user.username} successfully deleted."

    transaction.delete()

    context = {"message": message}
    return Response(context)

@api_view(["GET"])
def transactions_view(request):

    transactions = Transaction.objects.all()
    transaction_serializer = TransactionSerializer(transactions, many=True)

    context = {transaction_serializer.data}
    return Response(context)

@api_view(["GET"])
def transaction_view(request, transaction_id):

    transaction = Transaction.objects.get(id=transaction_id) 
    transaction_serializer = TransactionSerializer(transaction)

    context = {transaction_serializer.data}
    return Response(context)

