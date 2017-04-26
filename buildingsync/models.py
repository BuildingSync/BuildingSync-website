from __future__ import unicode_literals

from django.db import models


class UseCase(models.Model):
    nickname = models.CharField(max_length=100, default="NickName")
    show = models.BooleanField(default=True)


class Schema(models.Model):
    name = models.CharField(max_length=100, default="2.0.0")


# need to create a database of schema entries?  I dunno how I'm going to wire this all up yet
# but when I do, the Schema should include the full list of entries
# and then the UseCase should include a list of true/false values for that schema
