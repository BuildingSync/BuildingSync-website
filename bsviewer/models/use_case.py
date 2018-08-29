from django.contrib.auth.models import User
from django.db import models


class UseCase(models.Model):
    owner = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
    name = models.CharField(max_length=100, default="Use Case Name")
    schema = models.ForeignKey('Schema', on_delete=models.CASCADE, db_index=True)
    make_public = models.BooleanField(default=False)

    def __str__(self):
        return self.name
