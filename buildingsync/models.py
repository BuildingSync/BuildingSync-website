from __future__ import unicode_literals

from django.contrib.auth.models import User
from django.db import models


class UseCase(models.Model):
    owner = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
    nickname = models.CharField(max_length=100, default="NickName")
    show = models.BooleanField(default=True)


class Schema(models.Model):
    name = models.CharField(max_length=100, default="2.0.0")
    version = models.IntegerField()  # it may not be integer, but that's what I'm doing for now


class BuildingSyncAttribute(models.Model):
    pure_name = models.CharField(max_length=100, default="<name>")
    name = models.CharField(max_length=250)
    type = models.CharField(max_length=100, default="<unknown_type>")
    schema = models.ForeignKey(Schema, related_name="schema")
    required_use_cases = models.ManyToManyField(UseCase, related_name="required_use_cases")
    optional_use_cases = models.ManyToManyField(UseCase, related_name="optional_use_cases")
    ignored_use_cases = models.ManyToManyField(UseCase, related_name="ignored_use_cases")
    tree_level = models.IntegerField()
    index = models.IntegerField(verbose_name="For a given schema, this is the linear index in the tree list", default=0)
    path = models.CharField(max_length=250, default="")
