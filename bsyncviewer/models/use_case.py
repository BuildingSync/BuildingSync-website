import os

from django.contrib.auth.models import User
from django.contrib.postgres.fields import ArrayField
from django.db import models
from django.db.models.signals import post_save, pre_save, post_delete
from django.dispatch import receiver
from django.core.validators import FileExtensionValidator


class UseCase(models.Model):
    owner = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
    name = models.CharField(max_length=100, default="Use Case Name")
    description = models.TextField()
    schema = models.ForeignKey('Schema', on_delete=models.CASCADE, db_index=True)
    make_public = models.BooleanField(default=False)
    import_file = models.FileField(upload_to='usecase_mappings/', null=True, blank=True, validators=[FileExtensionValidator(allowed_extensions=['sch'])],help_text="This should be a Schematron file defining the use case")

    def __str__(self):
        return self.name

    def __init__(self, *args, **kwargs):
        super(UseCase, self).__init__(*args, **kwargs)
        self.__original_import_file = self.import_file


# These two auto-delete files from filesystem when they are unneeded:
@receiver(post_delete, sender=UseCase)
def auto_delete_file_on_delete(sender, instance, **kwargs):
    """
    Deletes file from filesystem
    when corresponding `UseCase` object is deleted.
    """
    print("INSTANCE IMPORT FILE? {}".format(instance.import_file))
    if instance.import_file:
        if os.path.isfile(instance.import_file.path):
            os.remove(instance.import_file.path)


@receiver(pre_save, sender=UseCase)
def auto_delete_file_on_change(sender, instance, **kwargs):
    """
    Deletes old file from filesystem
    when corresponding `File` object is updated
    with new file.
    """

    if not instance.pk:
        return False

    try:
        usecase = UseCase.objects.get(pk=instance.pk)
        if bool(usecase.import_file) is False:
            return False
        else:
            old_file = usecase.import_file
    except UseCase.DoesNotExist:
        return False

    new_file = instance.import_file
    if not old_file == new_file:
        if os.path.isfile(old_file.path):
            os.remove(old_file.path)
