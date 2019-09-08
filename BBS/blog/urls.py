from django.conf.urls import url
from blog import views

urlpatterns = [
    # 后台添加文章
    url(r"backend/add_article/",views.add_article),
    # 点赞和反对
    url(r'up_down/', views.up_down),
    # 评论
    url(r'comment/', views.comment),
    # 评论树
    url(r'comment_tree/(\d+)/', views.comment_tree),
    # 左侧内容
    url(r'(\w+)/(tag|category|archive)/(.+)/', views.home),  # home(request, username, tag, 'python')
    # 文章详情
    url(r'(\w+)/article/(\d+)/$', views.article_detail),  # (\d+)会捕获url中的值
    # 个人博客
    url(r'(\w+)', views.home),  # (\w+)会传到views.py的home中
]
