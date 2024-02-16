from django.urls import include, path

urlpatterns = [
    path("authentication/", include("authentication.urls")),
    path("products/", include("product.urls")),
    path("orders/", include("order.urls")),
    path("transactions/", include("transaction.urls")),
]
