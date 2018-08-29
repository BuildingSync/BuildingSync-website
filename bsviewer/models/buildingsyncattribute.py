from django.db import models


class BuildingSyncAttribute(models.Model):
    pure_name = models.CharField(max_length=100, default="<name>")
    name = models.CharField(max_length=250, db_index=True)
    type = models.CharField(max_length=100, default="<unknown_type>")
    schema = models.ForeignKey(
        'Schema', on_delete=models.CASCADE, related_name="attributes", db_index=True
    )
    required_use_cases = models.ManyToManyField('UseCase', related_name="required_use_cases")
    optional_use_cases = models.ManyToManyField('UseCase', related_name="optional_use_cases")
    ignored_use_cases = models.ManyToManyField('UseCase', related_name="ignored_use_cases")
    tree_level = models.IntegerField()
    index = models.IntegerField(
        verbose_name="For a given schema, this is the linear index in the tree list", default=0
    )
    path = models.CharField(max_length=500, default="")

    def __str__(self):
        return self.name
