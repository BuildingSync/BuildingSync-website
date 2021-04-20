from django import template
from django.urls import Resolver404, resolve

register = template.Library()


@register.simple_tag
def active_page(request, *view_names):
    if not request:
        return ''
    try:
        return "active" if resolve(request.path_info).url_name in view_names else ""
    except Resolver404:
        return ''
