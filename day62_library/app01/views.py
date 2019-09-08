from django.shortcuts import HttpResponse,render,redirect
from app01 import models

# Create your views here.

# 展示出版社
def publisher_list(request):
    ret = models.Publisher.objects.all()
    return render(request,'publisher_list.html',{'publisher_list':ret})

# 添加出版社
def add_publisher(request):
    error_msg = ''
    if request.method == 'POST':
        Newname = request.POST.get('publisher_name')
        if Newname:
            models.Publisher.objects.create(name=Newname)
            return redirect('/publisher_list/')
        else:
            error_msg = '出版社名称不能为空'
    return render(request,'add_publisher.html',{'error':error_msg})

# 删除出版社
def delete_publisher(request):
    # 删除指定的数据
    #1.从GET请求的参数里面拿到将要删除的数据的ID值
    del_id = request.GET.get('id',None)
    # 如果能取到id值
    if del_id:
        # 去数据库删除当前id值的数据
        # 根据id值查找到数据
        del_obj = models.Publisher.objects.get(id = del_id)
        # 删除
        del_obj.delete()
        # 返回删除后的页面
        return redirect('/publisher_list/')
    else:
        return HttpResponse('删除错误')

# 编辑出版社
def edit_publisher(request):
    # 用户修改完出版社名称，点击提交按钮，向我发过来新的出版社名称
    if request.method == 'POST':
        # 取出版社的id和名称
        edit_id = request.POST.get('id')
        new_name = request.POST.get('publisher_name')
        # 更新出版社，根据id判断要修改的是哪一个出版社
        edit_publisher = models.Publisher.objects.get(id=edit_id)
        edit_publisher.name = new_name
        edit_publisher.save()# 将修改提交到数据库
        # 跳转到出版社页面，查看是否修改成功
        return redirect('/publisher_list/')
    # 从GET请求的URL中取到id参数
    edit_id = request.GET.get('id')
    if edit_id:
        # 获取当前出版社名称
        publisher_obj = models.Publisher.objects.get(id=edit_id)
        return render(request,'edit_publisher.html',{'publisher':publisher_obj})
    else:
        error_msg = '取值出错'
    return render(request,'edit_publisher.html',{'error':error_msg})

# 展示书籍
def book_list(request):
    all_book = models.Book.objects.all()
    return render(request, 'book_list.html', {'book_list': all_book})

# 添加书籍
def add_book(request):
    if request.method == 'POST':
        new_title = request.POST.get('book_title')
        new_publisher_id = request.POST.get('publisher')
        # 创建新书对象，自动提交
        models.Book.objects.create(title=new_title,publisher_id=new_publisher_id)
        return redirect('/book_list/')
    publisher_obj = models.Publisher.objects.all()
    return render(request,'add_book.html',{'publisher_list':publisher_obj})

# 删除书籍
def delete_book(request):
    del_book_id = request.GET.get('id')
    if del_book_id:
        models.Book.objects.get(id=del_book_id).delete()
        return redirect('/book_list/')
    else:
        return HttpResponse('删除错误')

# 编辑书籍
def edit_book(request):
    if request.method == 'POST':
        edit_id = request.POST.get('id')
        new_title = request.POST.get('book_title')
        new_publisher_id = request.POST.get('publisher')
        edit_book_obj = models.Book.objects.get(id=edit_id)
        edit_book_obj.title = new_title
        edit_book_obj.publisher_id = new_publisher_id
        edit_book_obj.save()
        return redirect('/book_list/')
    edit_book_id = request.GET.get('id')
    if edit_book_id:
        publisher_obj = models.Book.objects.get(id=edit_book_id)
        rcp = models.Publisher.objects.all()
        return render(request,'edit_book.html',{'publisher_list':rcp,'publisher_name':publisher_obj})

# 展示作者
def author_list(request):

    author_obj = models.Author.objects.all()
    return render(request,'author_list.html',{'author_list':author_obj})

# 添加作者
def add_author(request):
    if request.method == 'POST':
        author_name = request.POST.get('author_name')
        # 对于多选框，getlist是获取一个列表多个值的意思
        books = request.POST.getlist('books')
        # 创建作者
        author_obj = models.Author.objects.create(name=author_name)
        # 将作者和新书建立联系，并且会自动提交
        author_obj.book.set(books)
        return redirect('/author_list/')
    book_obj = models.Book.objects.all()
    return render(request,'add_author.html',{'book_list':book_obj})

# 删除作者
def delete_author(request):
    delete_id = request.GET.get('id')
    models.Author.objects.get(id=delete_id).delete()
    return redirect('/author_list/')

# 编辑作者
def edit_author(request):
    if request.method == 'POST':
        new_edit_id = request.POST.get('author_id')
        new_edit_name = request.POST.get('author_name')
        new_edit_books = request.POST.getlist('books')
        new_author_obj = models.Author.objects.get(id=new_edit_id)
        new_author_obj.name = new_edit_name
        # 将与作者相关联的书设置成新修改后的书
        new_author_obj.book.set(new_edit_books)
        new_author_obj.save()
        return redirect('/author_list/')
    edit_id = request.GET.get('id')
    edit_author = models.Author.objects.get(id=edit_id)
    books_obj = models.Book.objects.all()
    author_obj = models.Author.objects.get(id=edit_id)
    return render(request,'edit_author.html',{'book_list':books_obj,'author_list':author_obj})