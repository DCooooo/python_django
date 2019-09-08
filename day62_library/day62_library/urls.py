"""day62_library URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from app01 import views

urlpatterns = [
    # 出版社相关url
    path('publisher_list/', views.publisher_list),
    path('add_publisher/', views.add_publisher),
    path('delete_publisher/', views.delete_publisher),
    path('edit_publisher/', views.edit_publisher),
    # 书籍相关url
    path('book_list/', views.book_list),
    path('add_book/', views.add_book),
    path('delete_book/', views.delete_book),
    path('edit_book/', views.edit_book),
    # 作者相关url
    path('author_list/', views.author_list),
    path('add_author/', views.add_author),
    path('edit_author/', views.edit_author),
]
