from django.db import models


class Attribute(models.Model):
    name = models.CharField(max_length=250, db_index=True)
    type = models.CharField(max_length=100, default="<unknown_type>")
    schema = models.ForeignKey(
        'Schema', on_delete=models.CASCADE, related_name="attributes", db_index=True
    )
    parent = models.CharField(max_length=250, null=True)
    tree_level = models.IntegerField()
    index = models.IntegerField(
        verbose_name="For a given schema, this is the linear index in the tree list", default=0
    )
    # There should only ever be one enumeration_class on an attribute
    enumeration_classes = models.ManyToManyField('EnumerationClass', through='AttributeEnumerationClass')
    path = models.CharField(max_length=500, default="")

    def __str__(self):
        return '- ' * self.tree_level + self.name
