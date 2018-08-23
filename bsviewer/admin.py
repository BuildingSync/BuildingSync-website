from django.contrib import admin

from .models import Schema, BuildingSyncAttribute, UseCase

class SchemaAdmin(admin.ModelAdmin):
	list_display = ('name', 'version', 'schema_file')

class UseCaseAdmin(admin.ModelAdmin):
	list_display = ('nickname', 'owner', 'show')

admin.site.register(Schema, SchemaAdmin)
admin.site.register(BuildingSyncAttribute)
admin.site.register(UseCase, UseCaseAdmin)