import os

if __name__ == '__main__':
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "day71_page.settings")
    import django
    django.setup()

    from app01 import models
    objs = [models.Book(title = '书籍{}'.format(i)) for i in range(1,105)]
    models.Book.objects.bulk_create(objs,5)