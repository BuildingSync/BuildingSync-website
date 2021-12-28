from django.db import models

# Bedes Term
class BedesTerm(models.Model):
    content_uuid = models.CharField(max_length=100, unique=True)
    term = models.CharField(max_length=100)
    category = models.CharField(max_length=100)
    url = models.CharField(max_length=300)
    definition = models.TextField(blank=True, null=True)

    def __str__(self):
        return self.term


# Bedes Term Mapping to Attribute
class BedesMapping(models.Model):
    attribute = models.ForeignKey('Attribute', on_delete=models.CASCADE, db_index=True)
    bedesTerm = models.ForeignKey('BedesTerm', on_delete=models.CASCADE, db_index=True)
    match_type = models.CharField(max_length=255, null=True)


# Bedes Enumeration
class BedesEnumeration(models.Model):
    content_uuid = models.CharField(max_length=100, unique=True)
    term = models.CharField(max_length=100)
    url = models.CharField(max_length=300)
    definition = models.TextField(blank=True, null=True)
    related_term_uuid = models.CharField(max_length=100, unique=False)


# Bedes Enumeration Mapping to Attribute Enumeration
class BedesEnumerationMapping(models.Model):
    enumeration = models.ForeignKey('Enumeration', on_delete=models.CASCADE, db_index=True)
    bedesEnumeration = models.ForeignKey('BedesEnumeration', on_delete=models.CASCADE, db_index=True)
