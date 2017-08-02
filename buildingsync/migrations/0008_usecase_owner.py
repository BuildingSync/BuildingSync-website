# -*- coding: utf-8 -*-
# Generated by Django 1.9.5 on 2017-04-29 14:18
from __future__ import unicode_literals

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('buildingsync', '0007_buildingsyncattribute_index'),
    ]

    operations = [
        migrations.AddField(
            model_name='usecase',
            name='owner',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL,
                                    to=settings.AUTH_USER_MODEL),
        ),
    ]