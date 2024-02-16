from django.urls import path
from . import views

urlpatterns = [
    path("add", views.add_view, name="add_order"),
    path("update", views.update_view, name="update_order"),
    path("delete", views.delete_view, name="delete_order"),

    path("", views.orders_view, name="orders"),
    path("<str:order_id>", views.order_view, name="order"),
]
