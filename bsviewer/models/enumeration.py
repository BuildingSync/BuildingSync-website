from django.db import models

from bsviewer.models.attribute import Attribute


class Enumeration(models.Model):
    name = models.CharField(max_length=250, db_index=True)
    attribute = models.ForeignKey(Attribute, on_delete=models.CASCADE, related_name='enumerations')
    class_name = models.CharField(max_length=250)
    required_use_cases = models.ManyToManyField('UseCase', related_name="required_enumerations")
    optional_use_cases = models.ManyToManyField('UseCase', related_name="optional_enumerations")
    ignored_use_cases = models.ManyToManyField('UseCase', related_name="ignored_enumerations")
    index = models.IntegerField(verbose_name='Index in the schema', default=0)
    path = models.CharField(max_length=500, default='')

    def __str__(self):
        return self.name
