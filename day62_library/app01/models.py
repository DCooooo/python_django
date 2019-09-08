from django.db import models

# Create your models here.
# 图书管理系统：书、作者、出版社

# 出版社
class Publisher(models.Model):
    id = models.AutoField(primary_key=True)# 自增的id主键
    name = models.CharField(max_length=64,null=False,unique=True)# 创建一个varchar(64)不为空的唯一的字段
    addr = models.CharField(max_length=128,default='江苏大学') # 此处是后来再加上的一个字段，针对于后加的字段，应指定默认值

# 书
class Book(models.Model):
    id = models.AutoField(primary_key=True)# 自增的主键
    title = models.CharField(max_length=64, null=False, unique=True)  # 创建一个varchar(64)不为空的唯一的书名字段
    publisher = models.ForeignKey(to='Publisher',on_delete=models.CASCADE) # 和Publisher关联的外键字段

# 作者——注意作者和书应该是多对多的关系
class Author(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=16,null=False,unique=True)
    # 通过下面这条语句，不仅可以生成Author表，还可以自动生成第三张表
    book = models.ManyToManyField(to='Book')# 建立作者和书的多对多的关系