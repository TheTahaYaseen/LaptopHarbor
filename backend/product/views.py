from rest_framework.response import Response
from rest_framework.decorators import api_view

from .serializers import ProductSerializer

from .models import Product, ProductBrand, ProductCategory

# Create your views here.
@api_view(["POST"])
def add_view(request):

    name = request.data["name"]
    description = request.data["description"]
    price = request.data["price"]
    category = request.data["category"]
    brand = request.data["brand"]
    units_in_stock = request.data["units_in_stock"]
    image = request.data["image"]
    
    fields = [name, description, price, category, brand, units_in_stock, image]    

    if "" in fields or None in fields:
        message = "All fields for the product must be given."
    elif len(name) > 255 or len(category) > 255 or len(brand) > 255: 
        message = "Name, Category and Brand cannot be longer than 255 characters."
    elif type(price) != int or type(units_in_stock) != int: 
        message = "Price and Units in stock must be integers."
    else:
        category, created = ProductCategory.objects.get_or_create(name=category)
        brand, created = ProductBrand.objects.get_or_create(name=brand)

        product = Product.objects.create(
            name=name, description=description, price=price, category=category, brand=brand, units_in_stock=units_in_stock, image=image
        )

        message = f"Product: {name} successfully created."

    context = {"message": message}
    return Response(context)

@api_view(["PUT"])
def update_view(request, product_id):

    product = Product.objects.get(id=product_id) 

    name = request.data["name"]
    description = request.data["description"]
    price = request.data["price"]
    category = request.data["category"]
    brand = request.data["brand"]
    units_in_stock = request.data["units_in_stock"]
    image = request.data["image"]
    
    fields = [name, description, price, category, brand, units_in_stock, image]    

    if "" in fields or None in fields:
        message = "All fields for the product must be given."
    elif len(name) > 255 or len(category) > 255 or len(brand) > 255: 
        message = "Name, Category and Brand cannot be longer than 255 characters."
    elif type(price) != int or type(units_in_stock) != int: 
        message = "Price and Units in stock must be integers."
    else:
        category, created = ProductCategory.objects.get_or_create(name=category)
        brand, created = ProductBrand.objects.get_or_create(name=brand)

        product.name = name
        product.description = description
        product.price = price
        product.category = category
        product.brand = brand
        product.units_in_stock = units_in_stock
        product.image = image
        
        product.save()

        message = f"Product: {name} successfully updated."

    context = {"message": message}
    return Response(context)

@api_view(["DELETE"])
def delete_view(request, product_id):

    product = Product.objects.get(id=product_id) 

    message = f"Product: {product.name} successfully deleted."

    product.delete()

    context = {"message": message}
    return Response(context)

@api_view(["GET"])
def products_view(request):

    products = Product.objects.all()
    product_serializer = ProductSerializer(products, many=True)

    context = {product_serializer.data}
    return Response(context)

@api_view(["GET"])
def product_view(request, product_id):

    product = Product.objects.get(id=product_id) 
    product_serializer = ProductSerializer(product)

    context = {product_serializer.data}
    return Response(context)

