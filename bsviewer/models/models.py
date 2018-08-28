from django.db import models
from django.db.models.signals import post_save
from django.contrib.auth.models import User
from django.dispatch import receiver
from bsviewer.schema_parser import process_schema


# Use Case
class UseCase(models.Model):
	owner = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
	nickname = models.CharField(max_length=100, default="NickName")
	show = models.BooleanField(default=True)

	def __str__(self):
		return self.nickname

