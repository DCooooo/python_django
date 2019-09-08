from django import template
from blog import models
from django.db.models import Count

register = template.Library()


@register.inclusion_tag('left_menu.html')
def get_left_menu(username):
    user = models.UserInfo.objects.filter(username=username).first()
    blog = user.blog
    # 将文章按照分类分组，并且统计每一个分类下面的文章数量
    category_list = models.Category.objects.filter(blog=blog).annotate(c=Count('article')).values('title', 'c')
    # 将文章按照标签分组，并且统计每一个标签下面的文章数量
    tag_list = models.Tag.objects.filter(blog=blog).annotate(t=Count('article')).values('title', 't')
    # 日期归档
    archive_list = models.Article.objects.filter(user=user).extra(
        select={'archive_ym': "date_format(create_time,'%%Y-%%m')"}
    ).values('archive_ym').annotate(c=Count('nid')).values('archive_ym', 'c')
    return {
        'username':username,
        'category_list': category_list,
        'tag_list': tag_list,
        'archive_list': archive_list
    }
