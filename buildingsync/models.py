from __future__ import unicode_literals

from django.db import models


class Schema(models.Model):
    original_file_path = models.CharField(max_length=255,
                                          blank=False,  # don't allow blanks during validation
                                          null=False,  # don't allow null in the database (use empty string)
                                          default='/Users/elee/schemas/BuildingSync_2_0.xsd',
                                          help_text='The original absolute path of the schema',
                                          verbose_name='Absolute file path')
    local_file_path = models.CharField(max_length=255,
                                       blank=False,
                                       null=False,
                                       default='schemas/x.y.z-tagname/filename.xsd',
                                       help_text='The path to the schema xsd file relative to the buildingsync app',
                                       verbose_name='Local file path')
    # root_item =
