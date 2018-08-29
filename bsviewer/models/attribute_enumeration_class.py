from django.db import models


class AttributeEnumerationClass(models.Model):
    attribute = models.ForeignKey('Attribute', on_delete=models.CASCADE)
    enumeration_class = models.ForeignKey('EnumerationClass', on_delete=models.CASCADE)
