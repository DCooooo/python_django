from django.shortcuts import render
from app01 import models
# Create your views here.

def book(request):
    # 从URL获取参数
    # 当前页
    page_num = request.GET.get('page')
    # 获取总数据
    total_count = models.Book.objects.all().count()

    # 调用一个类
    from utils.pages import Page
    page_obj = Page(page_num,total_count,url_prefix='book',per_page=10,max_page=7)
    ret = models.Book.objects.all()[page_obj.start:page_obj.end]
    page_html = page_obj.page_html()
    return render(request,'book.html',{'books':ret,'page_html':page_html})

def dept(request):
    # 从URL获取参数
    # 当前页
    page_num = request.GET.get('page')
    # # 每一页显示多少数据
    # per_page = 10
    # 获取总数居
    total_count = models.Dept.objects.all().count()

    # 调用一个类
    from utils.pages import Page
    page_obj = Page(page_num, total_count, url_prefix='dept', per_page=10, max_page=9)
    ret = models.Dept.objects.all()[page_obj.start:page_obj.end]
    page_html = page_obj.page_html()
    return render(request, 'dept.html', {'dept': ret, 'page_html': page_html})