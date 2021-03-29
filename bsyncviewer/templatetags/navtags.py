from django import template

register = template.Library()


@register.simple_tag
def active_page(request, *view_names):
  from django.urls import resolve, Resolver404
  if not request:
    return ''
  try:
    return "active" if resolve(request.path_info).url_name in view_names else ""
  except Resolver404:
    return ''
