from django.contrib.auth.models import User
from django.db import models

from bsviewer.models.use_case_attribute import UseCaseEnumeration, UseCaseAttribute

class UseCase(models.Model):
    owner = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
    name = models.CharField(max_length=100, default="Use Case Name")
    schema = models.ForeignKey('Schema', on_delete=models.CASCADE, db_index=True)
    attributes = models.ManyToManyField('Attribute', through=UseCaseAttribute)
    enumerations = models.ManyToManyField('Enumeration', through=UseCaseEnumeration)
    make_public = models.BooleanField(default=False)
    import_file = models.FileField(upload_to='use_case_mappings/', null=True, help_text="Upload a csv file containing the mapping of your use case to the BuildingSync schema.")

    def __str__(self):
        return self.name
