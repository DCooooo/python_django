from django.shortcuts import render, HttpResponse, redirect
from geetest import GeetestLib
from django.http import JsonResponse
from django.contrib import auth
from blog import forms
from blog import models
from django.views import View


# Create your views here.
# 使用极验滑动验证码的登录功能
def login(request):
    # if request.is_ajax():  # 如果是AJAX请求
    if request.method == "POST":
        # 初始化一个给AJAX返回的数据
        ret = {"status": 0, "msg": ""}
        # 从提交过来的数据中 取到用户名和密码
        username = request.POST.get("username")
        pwd = request.POST.get("password")
        # 获取极验 滑动验证码相关的参数
        gt = GeetestLib(pc_geetest_id, pc_geetest_key)
        challenge = request.POST.get(gt.FN_CHALLENGE, '')
        validate = request.POST.get(gt.FN_VALIDATE, '')
        seccode = request.POST.get(gt.FN_SECCODE, '')
        status = request.session[gt.GT_STATUS_SESSION_KEY]
        user_id = request.session["user_id"]

        if status:
            result = gt.success_validate(challenge, validate, seccode, user_id)
        else:
            result = gt.failback_validate(challenge, validate, seccode)
        if result:
            # 验证码正确
            # 利用auth模块做用户名和密码的校验
            user = auth.authenticate(username=username, password=pwd)
            if user:
                # 用户名密码正确
                # 给用户做登录
                auth.login(request, user)  # 将登录用户赋值给request.user
                ret["msg"] = "/index/"
            else:
                # 用户名密码错误
                ret["status"] = 1
                ret["msg"] = "用户名或密码错误！"
        else:
            ret["status"] = 1
            ret["msg"] = "验证码错误"

        return JsonResponse(ret)
    return render(request, "login.html")


# 账号退出
def logout(request):
    auth.logout(request)
    return redirect('/index/')


def index(request):
    # 查询文章列表
    article_list = models.Article.objects.all()
    return render(request, 'index.html', {'article_list': article_list})


# 注册的视图函数
def register(request):
    if request.method == 'POST':
        ret = {'status': 0, 'msg': ''}
        # 获取页面上传来的信息
        forms_obj = forms.RegForm(request.POST)
        if forms_obj.is_valid():
            # 校验通过，就去数据库创建一个新用户
            forms_obj.cleaned_data.pop('re_password')  # 存入数据库时，需要将确认密码删除
            avatar_img = request.FILES.get('avatar')
            models.UserInfo.objects.create_user(**forms_obj.cleaned_data, avatar=avatar_img)
            ret["msg"] = '/index/'
            return JsonResponse(ret)
        else:
            ret['status'] = 1
            ret['msg'] = forms_obj.errors
            return JsonResponse(ret)
    forms_obj = forms.RegForm()
    return render(request, 'register.html', {'forms_obj': forms_obj})


# 处理极验验证码的试视图
# 请在官网申请ID使用，示例ID不可使用
pc_geetest_id = "b46d1900d0a894591916ea94ea91bd2c"
pc_geetest_key = "36fc3fe98530eea08dfc6ce76e3d24c4"


def get_geetest(request):
    user_id = 'test'
    gt = GeetestLib(pc_geetest_id, pc_geetest_key)
    status = gt.pre_process(user_id)
    request.session[gt.GT_STATUS_SESSION_KEY] = status
    request.session["user_id"] = user_id
    response_str = gt.get_response_str()
    return HttpResponse(response_str)


# 失去焦点时校验用户名是否被注册
def check_username_exist(request):
    ret = {'status': 0, 'msg': ''}
    username = request.GET.get('username')
    is_exist = models.UserInfo.objects.filter(username=username)
    if is_exist:
        ret['status'] = 1
        ret['msg'] = '用户名已被注册'
    return JsonResponse(ret)


def check_email_exist(request):
    ret = {'status': 0, 'msg': ''}
    email = request.GET.get('email')
    is_exist = models.UserInfo.objects.filter(email=email)
    if is_exist:
        ret['status'] = 1
        ret['msg'] = '邮箱已被注册'
    return JsonResponse(ret)


# 个人博客主页
def home(request, username, *args):  # username是随意设置的一个变量，用于接收url中填写的字段
    # 去UserInfo表中把对应的用户取出来
    user = models.UserInfo.objects.filter(username=username).first()
    if not user:
        return HttpResponse('404')
    blog = user.blog
    if not args:
        # args没有接收到参数，默认走的是用户的个人博客页面！
        article_list = models.Article.objects.filter(user=user)
    else:
        # 表示按照文章的分类或tag或日期归档来查询
        # args = ("category", "技术")
        if args[0] == "category":
            article_list = models.Article.objects.filter(user=user).filter(category__title=args[1])
        elif args[0] == "tag":
            article_list = models.Article.objects.filter(user=user).filter(tags__title=args[1])
        else:
            # 按照日期归档
            try:
                year, month = args[1].split("-")
                article_list = models.Article.objects.filter(user=user).filter(
                    create_time__year=year, create_time__month=month
                )
                print(article_list)
            except Exception as e:
                return HttpResponse("404")

    return render(request,
                  'home.html',
                  {
                      'username': username,
                      'blog': blog,
                      'article_list': article_list,
                  })


# 文章详情
def article_detail(request, username, pk):
    '''

    :param request:
    :param username: 被访问的blog用户名
    :param pk: 访问文章的id值，pk意为主键
    :return:
    '''
    user = models.UserInfo.objects.filter(username=username).first()
    if not user:
        return HttpResponse('404')
    blog = user.blog
    article_obj = models.Article.objects.filter(pk=pk).first()
    # 评论列表
    comment_list = models.Comment.objects.filter(article_id=pk)

    return render(
        request,
        'article_detail.html',
        {
            'username': username,
            'article_obj': article_obj,
            'blog': blog,
            'comment_list': comment_list,
        })


import json
from django.db.models import F


def up_down(request):
    article_id = request.POST.get('article_id')
    is_up = json.loads(request.POST.get('is_up'))  # is_up在python中是大写的，传过来之后是标准的json格式，小写的，我们需要用json转换成大写的，不然就识别出错
    user = request.user
    response = {'state': True}
    try:
        models.ArticleUpDown.objects.create(user=user, article_id=article_id, is_up=is_up)
        if (is_up):
            models.Article.objects.filter(pk=article_id).update(up_count=F('up_count') + 1)
        else:
            models.Article.objects.filter(pk=article_id).update(down_count=F('down_count') + 1)
    except Exception as e:
        response['state'] = False
        response['first_action'] = models.ArticleUpDown.objects.filter(article_id=article_id, user=user).first().is_up
    return JsonResponse(response)


def comment(request):
    article_id = request.POST.get('article_id')
    content = request.POST.get('content')
    pid = request.POST.get('pid')
    user_pk = request.user.pk
    response = {}
    # 如果为根评论
    if not pid:
        comment_obj = models.Comment.objects.create(article_id=article_id, user_id=user_pk, content=content)
        models.Article.objects.filter(pk=article_id).update(comment_count=F('comment_count') + 1)
    else:
        comment_obj = models.Comment.objects.create(article_id=article_id, user_id=user_pk, content=content,
                                                    parent_comment_id=pid)
        models.Article.objects.filter(pk=article_id).update(comment_count=F('comment_count') + 1)
    response['create_time'] = comment_obj.create_time.strftime('%Y-%m-%d')
    response['content'] = comment_obj.content
    response['username'] = comment_obj.user.username

    return JsonResponse(response)


def comment_tree(request, article_id):
    ret = list(models.Comment.objects.filter(article_id=article_id).values("pk", "content", "parent_comment_id"))
    return JsonResponse(ret, safe=False)


def add_article(request):
    if request.method == "POST":
        title = request.POST.get('title')
        article_content = request.POST.get('article_content')
        category = request.POST.get('category')
        tags = request.POST.get('tags')
        user = request.user
        blog_id = user.blog.nid

        from bs4 import BeautifulSoup

        bs = BeautifulSoup(article_content, "html.parser")
        desc = bs.text[0:150] + "..."

        # 过滤非法标签
        for tag in bs.find_all():

            print(tag.name)

            if tag.name in ["script", "link"]:
                tag.decompose()

        # 生成博客信息和分类的关系
        models.Category.objects.create(blog_id=blog_id, title=category)
        # 生成博客信息和标签的关系
        models.Tag.objects.create(blog_id=blog_id, title=tags)
        # 取到分类的id值
        category_id = list(models.Category.objects.filter(title=category).values_list('nid').first())
        for i in category_id:
            category_id = int(i)
        # 取到标签的id值
        tags_id = list(models.Tag.objects.filter(title=tags).values_list('nid').first())
        for i in tags_id:
            tags_id = int(i)

        article_obj = models.Article.objects.create(user=user, title=title, desc=desc, category_id=category_id)
        # 取到文章的id值
        article_id = list(models.Article.objects.filter(title=title).values_list('nid').first())
        for i in article_id:
            article_id = int(i)
        # 生成文章和标签的对应关系
        models.Article2Tag.objects.create(article_id=article_id,tag_id=tags_id)

        models.ArticleDetail.objects.create(content=str(bs), article=article_obj)

        return render(request, "success.html")

    return render(request, "add_article.html")


from BBS import settings
import os, json


def upload(request):
    obj = request.FILES.get("upload_img")
    path = os.path.join(settings.MEDIA_ROOT, "add_article_img", obj.name)

    with open(path, "wb") as f:
        for line in obj:
            f.write(line)

    res = {
        "error": 0,
        "url": "/media/add_article_img/" + obj.name
    }

    return HttpResponse(json.dumps(res))


# 上传个人样式
# CBV方式（class base views）
class Upload(View):
    def post(self, request):
        '''
        保存上传文件前，数据需要存放在某个位置。默认当上传文件小于2.5M时，django会将上传文件的全部内容读进内存。从内存读取一次，写磁盘一次。
        但当上传文件很大时，django会把上传文件写到临时文件中，然后存放到系统临时文件夹中。
        :param request:
        :return:
        '''
        # 从请求的FILES中获取上传文件的文件名，file为页面上type=files类型input的name属性值
        filename = request.FILES.get("upload_files").name
        path = os.path.join(settings.MEDIA_ROOT, "theme", filename)
        with open(path, 'wb') as f:
            # 从上传的文件对象中一点一点读
            for chunk in request.FILES['upload_files'].chunks():
                # 写入本地文件
                f.write(chunk)
        return render(request, 'success.html')
