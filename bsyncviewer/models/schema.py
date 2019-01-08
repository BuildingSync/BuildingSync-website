import csv
import os

from django.conf import settings
from django.db import models
from django.db.models.signals import post_save, post_delete, pre_save
from django.dispatch import receiver

from bsyncviewer.lib.schema_parser import process_schema


def rename_schema_file(instance, path):
    if instance.version:
        return '{}buildingsync_v_{}.xsd'.format('uploaded_schemas/',
                                                instance.version.replace('.', '_'))
    else:
        pass


# BuildingSync Schema versions
class Schema(models.Model):
    name = models.CharField(max_length=100, default="0.3.0", unique=True)
    version = models.CharField(max_length=100, default="0.3.0", unique=True, null=False)
    schema_file = models.FileField(upload_to=rename_schema_file, null=True)
    schema_parsed = models.BooleanField(default=False,
                                        help_text="Leave blank. This will be auto-populated.")
    usecase_template_file = models.FileField(upload_to='usecase_templates/', null=True, blank=True,
                                             help_text='Leave blank. This will be auto-populated.')

    def __str__(self):
        return self.name

    def save_template(self):
        """
        Generate and save the use case template to the database (and file system)

        :return: None
        """
        required_paths = ['Audits']

        # persist the contents of the schema into a csv format
        data = [['BuildingSyncPath', 'State']]
        for attribute in self.attributes.all().order_by('id'):
            if attribute.path in required_paths:
                data.append([attribute.path, 'Required'])
            else:
                data.append([attribute.path, ''])

        # create the path if it doesn't exist yet (in docker the path is automatically created)
        os.makedirs(
            '%s/%s' % (
                settings.MEDIA_ROOT, self._meta.get_field('usecase_template_file').upload_to
            ),
            exist_ok=True
        )

        # upload_to has the trailing slash
        tmp_file = '%s/%stemplate_%s.csv' % (
            settings.MEDIA_ROOT,
            self._meta.get_field('usecase_template_file').upload_to,
            self.version
        )

        # save to model
        with open(tmp_file, 'w') as f:
            f.truncate()  # clear out the file if it already exists
            wr = csv.writer(f)
            wr.writerows(data)

        # manually set the name of the file. The root is the MEDIA_ROOT, so include all but that.
        self.usecase_template_file.name = '%stemplate_%s.csv' % (
            self._meta.get_field('usecase_template_file').upload_to,
            self.version
        )

        # save the instance of the model.
        self.save()


@receiver(post_save, sender=Schema)
def parse_schema(sender, instance, **kwargs):
    # if parsed bool is false, call 'parse' function in schema_parser
    # set 'parsed' bool to True on Schema model and save
    if instance.schema_parsed is False and instance.schema_file:
        process_schema(instance)
        # set parsed = true so it doesn't get parsed again
        instance.schema_parsed = True
        instance.save()

    # also create and save use case template
    if not instance.usecase_template_file:
        instance.save_template()


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

    if instance.usecase_template_file:
        if os.path.isfile(instance.usecase_template_file.path):
            os.remove(instance.usecase_template_file.path)


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

        if os.path.isfile(instance.usecase_template_file.path):
            os.remove(instance.usecase_template_file.path)
            instance.usecase_template_file = None
