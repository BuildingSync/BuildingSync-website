from django.contrib import admin
from django.contrib.admin import AdminSite
from django.contrib.auth.admin import GroupAdmin, UserAdmin
from django.contrib.auth.models import Group, User

from .models.attribute import Attribute
from .models.schema import Schema
from .models.use_case import UseCase


class SchemaAdmin(admin.ModelAdmin):
    list_display = ('name', 'version', 'schema_file', 'schema_parsed')


class UseCaseAdmin(admin.ModelAdmin):
    list_display = ('name', 'owner', 'schema', 'import_file', 'usecase_parsed', 'make_public')


class MyAdminSite(AdminSite):
    site_header = "BuildingSync Schema Viewer"
    site_title = 'BuildingSync Schema Viewer'


admin_site = MyAdminSite(name='admin')
admin_site.register(Schema, SchemaAdmin)
admin_site.register(Attribute)
admin_site.register(UseCase, UseCaseAdmin)

# default models
admin_site.register(User, UserAdmin)
admin_site.register(Group, GroupAdmin)
