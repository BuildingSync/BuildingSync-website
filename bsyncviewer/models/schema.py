import os

from bsyncviewer.lib.schema_parser import process_schema
from bsyncviewer.lib.documentation_generator.generate_docs import (
    get_docs_path,
    generate_docs
)
# from django.conf import settings
from django.db import models
from django.db.models.signals import post_delete, post_save, pre_save
from django.dispatch import receiver


def rename_schema_file(instance, path):
    if instance.version:
        return '{}buildingsync_v_{}.xsd'.format('uploaded_schemas/',
                                                instance.version.replace('.', '_'))
    else:
        pass


def rename_enumerations_file(instance, path):
    if instance.version:
        formatted_version = instance.version.replace(".", "_")
        return f'uploaded_schemas/buildingsync_v_{formatted_version}_enumerations.json'
    else:
        pass


# BuildingSync Schema versions
class Schema(models.Model):
    name = models.CharField(max_length=100, default="1.0.0", unique=True)
    version = models.CharField(max_length=100, default="1.0.0", unique=True, null=False)
    schema_file = models.FileField(upload_to=rename_schema_file, null=True)
    schema_parsed = models.BooleanField(default=False,
                                        help_text="Leave blank. This will be auto-populated.")
    enumerations_file = models.FileField(upload_to=rename_enumerations_file,
                                         null=True,
                                         help_text='The enumerations JSON file built in the BuildingSync/schema repository which includes terms and measures.')

    def __str__(self):
        return self.name


@receiver(post_save, sender=Schema)
def parse_schema(sender, instance, **kwargs):
    # if parsed bool is false, call 'parse' function in schema_parser
    # set 'parsed' bool to True on Schema model and save
    if instance.schema_parsed is False and instance.schema_file:
        process_schema(instance)
        generate_docs(instance.schema_file.path, instance.version)
        # set parsed = true so it doesn't get parsed again
        instance.schema_parsed = True
        instance.save()


# These two auto-delete files from filesystem when they are unneeded:
@receiver(post_delete, sender=Schema)
def auto_delete_file_on_delete(sender, instance, **kwargs):
    """
    Deletes file from filesystem
    when corresponding `Schema` object is deleted.
    """
    if instance.schema_file:
        if os.path.isfile(instance.schema_file.path):
            os.remove(instance.schema_file.path)

        if os.path.isfile(instance.enumerations_file.path):
            os.remove(instance.enumerations_file.path)

        generated_docs = get_docs_path(instance.version)
        if os.path.isfile(generated_docs):
            os.remove(generated_docs)


@receiver(pre_save, sender=Schema)
def auto_delete_file_on_change(sender, instance, **kwargs):
    """
    Deletes old file from filesystem
    when corresponding `File` object is updated
    with new file.
    """
    if not instance.pk:
        return False

    try:
        old_file = Schema.objects.get(pk=instance.pk).schema_file
    except Schema.DoesNotExist:
        return False

    new_file = instance.schema_file
    if not old_file == new_file:
        if os.path.isfile(old_file.path):
            os.remove(old_file.path)
