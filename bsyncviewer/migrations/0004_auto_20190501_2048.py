# Generated by Django 2.1.7 on 2019-05-01 20:48

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('bsyncviewer', '0003_usecaseattribute_grouping_level'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='UseCaseRequiredPairedElements',
            new_name='UseCaseRequiredPairedElement',
        ),
        migrations.RemoveField(
            model_name='usecaseattribute',
            name='level',
        ),
    ]
