from django.db import models


# BuildingSync Schema versions
class BedesTerm(models.Model):
    content_uuid = models.CharField(max_length=100, unique=True)
    term = models.CharField(max_length=100, unique=True)
    category = models.CharField(max_length=100)
    url = models.CharField(max_length=300)
    definition = models.TextField(blank=True, null=True)

    def __str__(self):
        return self.term


class BedesMapping(models.Model):
    attribute = models.ForeignKey('Attribute', on_delete=models.CASCADE, db_index=True)
    bedesTerm = models.ForeignKey('BedesTerm', on_delete=models.CASCADE, db_index=True)
