# Generated by Django 2.1.7 on 2019-05-01 20:38

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('bsyncviewer', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='UseCaseRequiredPairedElements',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('state', models.IntegerField(choices=[(0, 'Ignored'), (1, 'Optional'), (2, 'Required'), (3, 'Required-1'), (4, 'Optional-1')], default=0)),
                ('paired_attribute', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='bsyncviewer.Attribute')),
            ],
        ),
        migrations.AddField(
            model_name='usecaseattribute',
            name='group_id',
            field=models.IntegerField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='usecaseattribute',
            name='level',
            field=models.CharField(default='', max_length=500),
        ),
        migrations.AlterField(
            model_name='schema',
            name='name',
            field=models.CharField(default='1.0.0', max_length=100, unique=True),
        ),
        migrations.AlterField(
            model_name='schema',
            name='version',
            field=models.CharField(default='1.0.0', max_length=100, unique=True),
        ),
        migrations.AlterField(
            model_name='usecaseattribute',
            name='state',
            field=models.IntegerField(choices=[(0, 'Ignored'), (1, 'Optional'), (2, 'Required'), (3, 'Required-1'), (4, 'Optional-1')], default=0),
        ),
        migrations.AlterField(
            model_name='usecaseenumeration',
            name='state',
            field=models.IntegerField(choices=[(0, 'Ignored'), (1, 'Optional'), (2, 'Required'), (3, 'Required-1'), (4, 'Optional-1')], default=0),
        ),
        migrations.AlterField(
            model_name='usecaseudf',
            name='state',
            field=models.IntegerField(choices=[(0, 'Ignored'), (1, 'Optional'), (2, 'Required'), (3, 'Required-1'), (4, 'Optional-1')], default=0),
        ),
        migrations.AddField(
            model_name='usecaserequiredpairedelements',
            name='use_case_attribute',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='bsyncviewer.UseCaseAttribute'),
        ),
    ]
