import csv

from bsyncviewer.models.attribute import Attribute
from bsyncviewer.models.use_case_attribute import UseCaseAttribute, UseCaseUDF, STATE_TYPES


def process_usecase(use_case_object):
    """
    parse the use case to get all entries

    :param use_case_object: obj, UseCase object as defined by Django
    :return: obj, UseCase object;  list of errors

    """

    # remove all rows related to this use case from the tables
    UseCaseAttribute.objects.filter(use_case=use_case_object).delete()
    # UseCaseAttribute.objects.filter(use_case_id=use_case_object.pk)

    # Errors
    errors = []

    # process csv and save attributes
    reader = csv.DictReader(open(use_case_object.import_file.path))
    last_udf_fieldname = None
    for row in reader:

        # get state
        state_val = 0
        for state in STATE_TYPES:
            if state[1] == row['State']:
                state_val = state[0]

        # only processed non-ignored
        if state_val is not 0:
            # Special Case: User-Defined Fields
            # always come in pairs, assuming FieldName then FieldValue
            # need to preserve relationship btw FieldName and FieldValue
            # could be more than 1 within a UserDefinedFields section
            if 'UserDefinedFields.UserDefinedField.FieldName' in row['BuildingSyncPath']:

                # get attribute reference
                results = Attribute.objects.filter(path=row['BuildingSyncPath'],
                                                   schema=use_case_object.schema)

                if not results.exists():
                    errors.append('No attribute matching path: {}'.format(row['BuildingSyncPath']))
                    continue
                elif results.count() != 1:
                    errors.append(
                        'More than one attribute found matching path: {}'.format(row['BuildingSyncPath']))
                    continue

                attrib = results[0]

                # check if record already exists first
                rec = None
                uc_results = UseCaseAttribute.objects.filter(use_case=use_case_object, attribute=attrib)
                if uc_results.exists():
                    # don't add twice but get first record
                    rec = uc_results[0]
                else:

                    rec = UseCaseAttribute(
                        use_case=use_case_object,
                        attribute=attrib,
                        state=state_val
                    )
                    rec.save()

                udf = UseCaseUDF(
                    use_case_attribute=rec,
                    state=state_val,
                    values=row['RequiredValues']
                )
                udf.save()
                last_udf_fieldname = udf

            elif 'UserDefinedFields.UserDefinedField.FieldValue' in row['BuildingSyncPath']:

                # get attribute reference
                results = Attribute.objects.filter(path=row['BuildingSyncPath'],
                                                   schema=use_case_object.schema)

                if not results.exists():
                    errors.append('No attribute matching path: {}'.format(row['BuildingSyncPath']))
                    continue
                elif results.count() != 1:
                    errors.append(
                        'More than one attribute found matching path: {}'.format(row['BuildingSyncPath']))
                    continue

                attrib = results[0]
                # get state
                state_val = 0
                for state in STATE_TYPES:
                    if state[1] == row['State']:
                        state_val = state[0]

                # check if record already exists first
                rec = None
                uc_results = UseCaseAttribute.objects.filter(use_case=use_case_object, attribute=attrib)
                if uc_results.exists():
                    # don't add twice but get first record
                    rec = uc_results[0]
                else:
                    rec = UseCaseAttribute(
                        use_case=use_case_object,
                        attribute=attrib,
                        state=state_val
                    )
                    rec.save()

                udf = UseCaseUDF(
                    use_case_attribute=rec,
                    state=state_val,
                    values=row['RequiredValues'],
                    associated_field=last_udf_fieldname
                )
                udf.save()

                last_udf_fieldname.associated_field = udf
                last_udf_fieldname.save()

            else:
                # get attribute reference
                results = Attribute.objects.filter(path=row['BuildingSyncPath'],
                                                   schema=use_case_object.schema)

                if not results.exists():
                    errors.append('No attribute matching path: {}'.format(row['BuildingSyncPath']))
                    continue
                elif results.count() != 1:
                    errors.append(
                        'More than one attribute found matching path: {}'.format(row['BuildingSyncPath']))
                    continue

                attrib = results[0]
                # get state
                state_val = 0
                for state in STATE_TYPES:
                    if state[1] == row['State']:
                        state_val = state[0]

                # save new record
                rec = UseCaseAttribute(
                    use_case=use_case_object,
                    attribute=attrib,
                    state=state_val
                )
                rec.save()

    return use_case_object, errors
