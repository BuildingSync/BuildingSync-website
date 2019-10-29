# from django.db import models

# STATE_IGNORED = 0
# STATE_OPTIONAL = 1
# STATE_REQUIRED = 2
# STATE_REQUIRED_1 = 3
# STATE_OPTIONAL_1 = 4
# STATE_OPTIONAL_MULTI = 5

# STATE_TYPES = (
#     (STATE_IGNORED, 'Ignored'),
#     (STATE_OPTIONAL, 'Optional'),
#     (STATE_REQUIRED, 'Required'),
#     (STATE_REQUIRED_1, 'Required-1'),
#     (STATE_OPTIONAL_1, 'Optional-1'),
#     (STATE_OPTIONAL_MULTI, 'Optional-Multi')
# )


# # this stores which attributes are in this use case, their state, and info on group/level
# class UseCaseAttribute(models.Model):
#     use_case = models.ForeignKey('UseCase', on_delete=models.CASCADE)
#     attribute = models.ForeignKey('Attribute', on_delete=models.CASCADE)
#     state = models.IntegerField(choices=STATE_TYPES, default=STATE_IGNORED)
#     group_id = models.IntegerField(null=True, blank=True)
#     grouping_level = models.CharField(max_length=500, null=True, blank=True)

#     class Meta:
#         # there can only be one state for each attribute and use_case
#         unique_together = ('attribute', 'use_case')


# # this stores what the required_values are for an attribute in a use case
# # could be a subset of the full enum (in that case validate against attribute enum)
# # or attribute could not have an enum in the schema, just in the use case
# class UseCaseAttributeEnumeration(models.Model):
#     use_case_attribute = models.ForeignKey('UseCaseAttribute', on_delete=models.CASCADE)
#     enumeration = models.CharField(max_length=250, default="")

#     class Meta:
#         # there can only be one state for each enumeration and use_case
#         unique_together = ('enumeration', 'use_case_attribute')


# # this stores which attributes are required when another attribute is present (paired elements)
# # paired elements can also have required values, but those should be captured in the UseCaseAttribute model
# # (so rely on this table to capture the relationship, rely on UseCaseAttribute to capture the state & allowable values)
# class UseCaseRequiredPairedElement(models.Model):
#     use_case_attribute = models.ForeignKey('UseCaseAttribute', on_delete=models.CASCADE)
#     paired_attribute = models.ForeignKey('Attribute', on_delete=models.CASCADE)


# class UseCaseUDF(models.Model):
#     use_case_attribute = models.ForeignKey('UseCaseAttribute', on_delete=models.CASCADE)
#     state = models.IntegerField(choices=STATE_TYPES, default=STATE_IGNORED)
#     values = models.CharField(max_length=512)
#     associated_field = models.ForeignKey('UseCaseUDF', on_delete=models.CASCADE, blank=True, null=True)
