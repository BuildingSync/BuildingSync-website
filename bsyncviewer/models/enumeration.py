from django.db import models

from bsyncviewer.models.enumeration_class import EnumerationClass


class Enumeration(models.Model):
    name = models.CharField(max_length=250, db_index=True)
    # index = models.IntegerField(verbose_name='Index in the schema', default=0)

    # save a reference to the schema in order to allow for quick access to all the enumerations
    schema = models.ForeignKey(
        'Schema', on_delete=models.CASCADE, db_index=True, related_name='enumerations'
    )
    enumeration_class = models.ForeignKey(
        EnumerationClass, on_delete=models.CASCADE, related_name='enumerations'
    )

    def __str__(self):
        return self.name
