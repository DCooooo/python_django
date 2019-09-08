from django.db import models

# Create your models here.
class Book(models.Model):
    title = models.CharField(max_length=32)

    class Meta:
        db_table = 'book'

class Dept(models.Model):
    name = models.CharField(max_length=16, unique=True)

    class Meta:
        db_table = "dept"