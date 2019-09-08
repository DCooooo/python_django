"""BBS URL Configuration

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
from django.urls import path, include
from blog import views
from django.views.static import serve
from django.conf import settings
from django.conf.urls import url
from blog import urls as blog_urls

urlpatterns = [
    # django自带的后台页面
    path('admin/', admin.site.urls),
    path('login/', views.login),
    path('logout/', views.logout),
    path('index/', views.index),
    # 极验滑动验证码，获取验证码的url
    path('pc-geetest/register/', views.get_geetest),
    path('reg/', views.register),
    path('check_username_exist/', views.check_username_exist),
    path('check_email_exist/', views.check_email_exist),
    # media相关的路由配置
    url(r'^media/(?P<path>.*)$', serve, {"document_root": settings.MEDIA_ROOT}),
    path('blog/', include(blog_urls)),  # 将所有以blog开头的urls，都交给blog(app名)下的urls.py处理
    # 上传文件
    url(r'^upload/', views.upload),
    # 上传个人样式
    path('uploadCss/', views.Upload.as_view()),

]
