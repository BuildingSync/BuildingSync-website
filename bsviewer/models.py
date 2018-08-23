from django.db import models
from django.db.models.signals import post_save
from django.contrib.auth.models import User
from django.dispatch import receiver


def rename_schema_file(instance, path):
	if instance.version:
		return '{}buildingsync_v_{}.xsd'.format('uploaded_schemas/', instance.version.replace('.', '_'))
	else:
		pass
		

# Use Case
class UseCase(models.Model):
	owner = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
	nickname = models.CharField(max_length=100, default="NickName")
	show = models.BooleanField(default=True)

	def __str__(self):
		return self.nickname

# BuildingSync Schema versions
class Schema(models.Model):
	name = models.CharField(max_length=100, default="0.2.0", unique=True)
	version = models.CharField(max_length=100, default="0.2", unique=True, null=False)
	schema_file = models.FileField(upload_to=rename_schema_file)
	schema_parsed = models.BooleanField(default=False)

	def __str__(self):
		return self.name


# post_save process 
@receiver(post_save, sender=Schema)
def parse_schema(sender, instance, **kwargs):

	# TODO: if parsed bool is false, call 'parse' function in schema_parser
	# set 'parsed' bool to True on Schema model and save
	hello = 1		


class BuildingSyncAttribute(models.Model):
	pure_name = models.CharField(max_length=100, default="<name>")
	name = models.CharField(max_length=250, db_index=True)
	type = models.CharField(max_length=100, default="<unknown_type>")
	schema = models.ForeignKey(Schema, on_delete=models.CASCADE, related_name="schema", db_index=True)
	required_use_cases = models.ManyToManyField(UseCase, related_name="required_use_cases")
	optional_use_cases = models.ManyToManyField(UseCase, related_name="optional_use_cases")
	ignored_use_cases = models.ManyToManyField(UseCase, related_name="ignored_use_cases")
	tree_level = models.IntegerField()
	index = models.IntegerField(verbose_name="For a given schema, this is the linear index in the tree list", default=0)
	path = models.CharField(max_length=500, default="")

	def __str__(self):
		return self.name