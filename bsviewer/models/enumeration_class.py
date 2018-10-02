from django.db import models

class EnumerationClass(models.Model):
    name = models.CharField(max_length=250, db_index=True)

    # save a reference to the schema in order to allow for quick access to all the enumerations
    schema = models.ForeignKey('Schema', on_delete=models.CASCADE, db_index=True)

    def __str__(self):
        return self.name