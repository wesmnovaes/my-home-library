from django.shortcuts import render
from django.http import HttpResponse
from rest_framework import viewsets
from .models import Autor
from .serializers import AutorSerializer

# Create your views here.

def index(request):
    return HttpResponse("hELLO WORLD")

class AutorViewSet(viewsets.ModelViewSet):
    queryset = Autor.objects.all()
    serializer_class = AutorSerializer