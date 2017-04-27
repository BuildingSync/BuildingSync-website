from __future__ import unicode_literals

from django.db import models


class UseCase(models.Model):
    nickname = models.CharField(max_length=100, default="NickName")
    show = models.BooleanField(default=True)


class Schema(models.Model):
    name = models.CharField(max_length=100, default="2.0.0")


class BuildingSyncAttribute(models.Model):
    name = models.CharField(max_length=250)
    schema = models.ForeignKey(Schema, related_name="schema")
    use_cases = models.ManyToManyField(UseCase)
    tree_level = models.IntegerField()
