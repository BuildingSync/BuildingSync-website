# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-09-12 18:48
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('buildingsync', '0014_auto_20170802_1915'),
    ]

    operations = [
        migrations.AlterField(
            model_name='schema',
            name='name',
            field=models.CharField(default='0.2.0', max_length=100),
        ),
        migrations.AlterField(
            model_name='schema',
            name='version',
            field=models.CharField(default='0.2', max_length=100),
        ),
    ]