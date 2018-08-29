from django.db import models


class Enumeration(models.Model):
    name = models.CharField(max_length=250, db_index=True)
    attribute = models.ForeignKey(
        'BuildingSyncAttribute', on_delete=models.CASCADE, related_name='enumerations'
    )
    # required_use_cases = models.ManyToManyField('UseCase', related_name='required_use_cases')
    # optional_use_cases = models.ManyToManyField('UseCase', related_name='optional_use_cases')
    # ignored_use_cases = models.ManyToManyField('UseCase', related_name='ignored_use_cases')
    index = models.IntegerField(verbose_name='Index in the schema', default=0)
    path = models.CharField(max_length=500, default='')

    def __str__(self):
        return self.name
