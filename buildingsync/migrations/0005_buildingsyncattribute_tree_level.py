# -*- coding: utf-8 -*-
# Generated by Django 1.9.5 on 2017-04-27 05:01
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('buildingsync', '0004_buildingsyncattribute_name'),
    ]

    operations = [
        migrations.AddField(
            model_name='buildingsyncattribute',
            name='tree_level',
            field=models.IntegerField(default=0),
            preserve_default=False,
        ),
    ]
