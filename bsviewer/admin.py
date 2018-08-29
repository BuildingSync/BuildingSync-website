from django.contrib import admin

from .models.schema import Schema
from .models.buildingsyncattribute import BuildingSyncAttribute
from .models.usecase import UseCase

class SchemaAdmin(admin.ModelAdmin):
	list_display = ('name', 'version', 'schema_file')

class UseCaseAdmin(admin.ModelAdmin):
	list_display = ('name', 'owner', 'schema', 'make_public')

admin.site.register(Schema, SchemaAdmin)
admin.site.register(BuildingSyncAttribute)
admin.site.register(UseCase, UseCaseAdmin)