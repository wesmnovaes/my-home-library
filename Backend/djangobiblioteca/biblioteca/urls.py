from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import AutorViewSet

from . import views

router = DefaultRouter()
router.register(r'autor', AutorViewSet)

urlpatterns = [
    path('', include(router.urls)),
]