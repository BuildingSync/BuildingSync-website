from django.contrib import admin
from buildingsync.models import UseCase, Schema, BuildingSyncAttribute

admin.site.register(UseCase)
admin.site.register(Schema)
admin.site.register(BuildingSyncAttribute)
