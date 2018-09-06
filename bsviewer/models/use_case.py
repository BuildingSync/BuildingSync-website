from django.contrib.auth.models import User
from django.db import models
from django.contrib.postgres.fields import ArrayField
from django.db.models.signals import post_save
from django.dispatch import receiver

from bsviewer.models.use_case_attribute import UseCaseEnumeration, UseCaseAttribute
from bsviewer.lib.usecase_parser import process_usecase


class UseCase(models.Model):
    owner = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
    name = models.CharField(max_length=100, default="Use Case Name")
    schema = models.ForeignKey('Schema', on_delete=models.CASCADE, db_index=True)
    attributes = models.ManyToManyField('Attribute', through=UseCaseAttribute)
    enumerations = models.ManyToManyField('Enumeration', through=UseCaseEnumeration)
    make_public = models.BooleanField(default=False)
    import_file = models.FileField(upload_to='usecase_mappings/', null=True, blank=True)
    usecase_parsed = models.BooleanField(default=False)
    parsing_errors = ArrayField(models.CharField(max_length=255, blank=True), null=True)

    def __str__(self):
        return self.name

@receiver(post_save, sender=UseCase)
def parse_usecase(sender, instance, **kwargs):
    # if parsed bool is false, call 'parse' function in schema_parser
    # set 'parsed' bool to True on Schema model and save

    if instance.usecase_parsed is False and instance.import_file:
        # parse use case
        print('***In USE CASE IMPORT FILE***')
        instance, errors = process_usecase(instance)
        print("ERRORS: {}".format(errors))
        instance.parsing_errors = errors
        instance.usecase_parsed = True
        instance.save()
