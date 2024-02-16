from django.urls import path
from . import views

urlpatterns = [
    path("add", views.add_view, name="add_product"),
    path("update/<str:product_id>", views.update_view, name="update_product"),
    path("delete/<str:product_id>", views.delete_view, name="delete_product"),

    path("", views.products_view, name="products"),
    path("<str:product_id>", views.product_view, name="product"),
]
