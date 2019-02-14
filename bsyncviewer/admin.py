import re
from django.contrib import admin
from django.contrib.admin import AdminSite
from django.contrib.auth.admin import GroupAdmin, UserAdmin
from django.contrib.auth.models import Group, User
from django import forms

from .models.attribute import Attribute
from .models.schema import Schema
from .models.use_case import UseCase


class SchemaForm(forms.ModelForm):
    class Meta:
        model = Schema
        fields = '__all__'

    # validate that schema version is in X.X.X format (3 parts)
    def clean(self):
        version = self.cleaned_data.get('version')
        pattern = re.compile("\d+\.\d+\.\d+")

        if not pattern.match(version):
            raise forms.ValidationError("Version must be in X.X.X format. Example: 1.0.0")

        return self.cleaned_data


class SchemaAdmin(admin.ModelAdmin):
    form = SchemaForm


class UseCaseAdmin(admin.ModelAdmin):
    list_display = ('name', 'description', 'owner', 'schema', 'import_file', 'usecase_parsed', 'make_public')


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
