# Generated by Django 2.2.24 on 2021-12-28 22:08

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('bsyncviewer', '0011_auto_20211228_1904'),
    ]

    operations = [
        migrations.AlterField(
            model_name='bedesterm',
            name='term',
            field=models.CharField(max_length=100),
        ),
    ]
