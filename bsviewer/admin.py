from django.contrib import admin

from .models.schema import Schema
from .models.attribute import Attribute
from .models.use_case import UseCase

class SchemaAdmin(admin.ModelAdmin):
	list_display = ('name', 'version', 'schema_file')

class UseCaseAdmin(admin.ModelAdmin):
	list_display = ('name', 'owner', 'schema', 'make_public')

admin.site.register(Schema, SchemaAdmin)
admin.site.register(Attribute)
admin.site.register(UseCase, UseCaseAdmin)
