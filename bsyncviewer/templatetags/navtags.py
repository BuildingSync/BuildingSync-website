from django import template
from django.conf import settings
from django.urls import Resolver404, resolve

register = template.Library()


@register.inclusion_tag("google_analytics.html")
def google_analytics():
    return {
        "measurement_id": (
            ""
            if settings.DEBUG
            else getattr(settings, "GOOGLE_ANALYTICS_MEASUREMENT_ID", "")
        )
    }


@register.simple_tag
def active_page(request, *view_names):
    if not request:
        return ""
    try:
        return "active" if resolve(request.path_info).url_name in view_names else ""
    except Resolver404:
        return ""
