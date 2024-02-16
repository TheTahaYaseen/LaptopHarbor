from django.urls import path
from . import views

urlpatterns = [
    path("add", views.add_view, name="add_transaction"),
    path("update/<str:transaction_id>", views.update_view, name="update_transaction"),
    path("delete/<str:transaction_id>", views.delete_view, name="delete_transaction"),

    path("", views.transactions_view, name="transactions"),
    path("<str:transaction_id>", views.transaction_view, name="transaction"),
]
