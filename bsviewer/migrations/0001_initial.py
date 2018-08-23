# Generated by Django 2.1 on 2018-08-21 20:48

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='BuildingSyncAttribute',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('pure_name', models.CharField(default='<name>', max_length=100)),
                ('name', models.CharField(db_index=True, max_length=250)),
                ('type', models.CharField(default='<unknown_type>', max_length=100)),
                ('tree_level', models.IntegerField()),
                ('index', models.IntegerField(default=0, verbose_name='For a given schema, this is the linear index in the tree list')),
                ('path', models.CharField(default='', max_length=500)),
            ],
        ),
        migrations.CreateModel(
            name='Schema',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(default='0.2.0', max_length=100)),
                ('version', models.CharField(default='0.2', max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='UseCase',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nickname', models.CharField(default='NickName', max_length=100)),
                ('show', models.BooleanField(default=True)),
                ('owner', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.AddField(
            model_name='buildingsyncattribute',
            name='ignored_use_cases',
            field=models.ManyToManyField(related_name='ignored_use_cases', to='bsviewer.UseCase'),
        ),
        migrations.AddField(
            model_name='buildingsyncattribute',
            name='optional_use_cases',
            field=models.ManyToManyField(related_name='optional_use_cases', to='bsviewer.UseCase'),
        ),
        migrations.AddField(
            model_name='buildingsyncattribute',
            name='required_use_cases',
            field=models.ManyToManyField(related_name='required_use_cases', to='bsviewer.UseCase'),
        ),
        migrations.AddField(
            model_name='buildingsyncattribute',
            name='schema',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='schema', to='bsviewer.Schema'),
        ),
    ]
