from django.db import models

STATE_IGNORED = 0
STATE_OPTIONAL = 1
STATE_REQUIRED = 2

STATE_TYPES = (
    (STATE_IGNORED, 'Ignored'),
    (STATE_OPTIONAL, 'Optional'),
    (STATE_REQUIRED, 'Required'),
)


class UseCaseAttribute(models.Model):
    use_case = models.ForeignKey('UseCase', on_delete=models.CASCADE)
    attribute = models.ForeignKey('Attribute', on_delete=models.CASCADE)
    state = models.IntegerField(choices=STATE_TYPES, default=STATE_IGNORED)

    class Meta:
        # there can only be one state for each attribute and use_case
        unique_together = ('attribute', 'use_case')


class UseCaseEnumeration(models.Model):
    use_case = models.ForeignKey('UseCase', on_delete=models.CASCADE)
    enumeration = models.ForeignKey('Enumeration', on_delete=models.CASCADE)
    state = models.IntegerField(choices=STATE_TYPES, default=STATE_IGNORED)

    class Meta:
        # there can only be one state for each enumeration and use_case
        unique_together = ('enumeration', 'use_case')


class UseCaseUDF(models.Model):
    use_case_attribute = models.ForeignKey('UseCaseAttribute', on_delete=models.CASCADE)
    state = models.IntegerField(choices=STATE_TYPES, default=STATE_IGNORED)
    values = models.CharField(max_length=512)
    associated_field = models.ForeignKey('UseCaseUDF', on_delete=models.CASCADE, blank=True, null=True)
