import csv

from bsyncviewer.models.attribute import Attribute
from bsyncviewer.models.enumeration import Enumeration
from bsyncviewer.models.enumeration_class import EnumerationClass
from bsyncviewer.models.use_case_attribute import UseCaseAttribute, UseCaseAttributeEnumeration, UseCaseRequiredPairedElement, UseCaseUDF, STATE_TYPES


def process_usecase(use_case_object):
    """
    parse the use case to get all entries

    :param use_case_object: obj, UseCase object as defined by Django
    :return: obj, UseCase object;  list of errors

    """
    # remove all rows related to this use case from the tables
    UseCaseAttribute.objects.filter(use_case=use_case_object).delete()

    # Errors
    errors = []

    # process csv and save attributes
    reader = csv.DictReader(open(use_case_object.import_file.path))
    last_udf_fieldname = None
    for row in reader:
        print("PROCESSING: {}".format(row['BuildingSyncPath']))
        # get state
        state_val = 0
        for state in STATE_TYPES:
            if state[1] == row['State']:
                state_val = state[0]

        # only processed non-ignored
        if state_val != 0:

            # get attribute reference
            results = Attribute.objects.filter(path=row['BuildingSyncPath'],
                                               schema=use_case_object.schema)

            if not results.exists():
                errors.append('No attribute matching path: {}'.format(row['BuildingSyncPath']))
                continue
            elif results.count() != 1:
                errors.append('More than one attribute found matching path: {}'.format(row['BuildingSyncPath']))
                continue

            attrib = results[0]

            # get groupID
            groupId = None
            if 'GroupID' in row:
                if row['GroupID'] != "":
                    groupId = row['GroupID']

            # get groupingLevel
            groupingLevel = None
            if 'GroupingLevel' in row:
                if row['GroupingLevel'] != "":
                    groupingLevel = row['GroupingLevel']

            # Special Case: User-Defined Fields
            # always come in pairs, assuming FieldName then FieldValue
            # need to preserve relationship btw FieldName and FieldValue
            # could be more than 1 within a UserDefinedFields section
            if 'UserDefinedFields.UserDefinedField.FieldName' in row['BuildingSyncPath']:

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
                        state=state_val,
                        group_id=groupId,
                        grouping_level=groupingLevel
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
                        state=state_val,
                        group_id=groupId,
                        grouping_level=groupingLevel
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

                # save new record
                rec = UseCaseAttribute(
                    use_case=use_case_object,
                    attribute=attrib,
                    state=state_val,
                    group_id=groupId,
                    grouping_level=groupingLevel
                )
                rec.save()

                # process RequiredValues
                print("processReqVals")
                tmp_errors = process_required_values(row, attrib, rec, use_case_object.schema)
                if not tmp_errors:
                    errors = errors + tmp_errors

                # process RequiredElements
                print("processReqElems")
                tmp_errors = process_paired_elements(row, rec, use_case_object.schema)
                if not tmp_errors:
                    errors = errors + tmp_errors

    return use_case_object, errors


# for a record, narrow down the allowable enum
def process_required_values(row, attrib, rec, schema):
    errors = []

    if row['RequiredValues'] is not None and row['RequiredValues'] != "":
        # split the string into a list and strip whitespace
        vals = row['RequiredValues'].split(',')
        vals = [x.strip(' ') for x in vals]
        # print("vals are:{}".format(vals))

        for val in vals:
            # check if there's an enum for this attribute in schema
            # first get attribute_enumeration_class
            enum_classes = EnumerationClass.objects.filter(attribute=attrib, schema=schema)
            if not enum_classes.exists():
                # no enums, load as is in the table
                e = UseCaseAttributeEnumeration(
                    use_case_attribute=rec,
                    enumeration=val)
                e.save()

            else:
                # then get all possible enums
                possible_enums = Enumeration.objects.filter(enumeration_class=enum_classes[0])
                if possible_enums.exists():
                    if any(item.name.lower() == val.lower() for item in possible_enums):
                        # match, add it
                        e = UseCaseAttributeEnumeration(
                            use_case_attribute=rec,
                            enumeration=val)
                        e.save()
                    else:
                        # not found, add error message
                        errors.append("The required value " + val + " was not found in the schema attribute enumeration... skipping")
    return errors


# for a record, store the required elements
def process_paired_elements(row, rec, schema):

    errors = []

    if row['RequiredPairedElement'] != "":
        # split the string into a list and strip whitespace
        vals = row['RequiredPairedElement'].split(',')
        vals = [x.strip(' ') for x in vals]

        for val in vals:
            # add to table
            attrs = Attribute.objects.filter(path=val, schema=schema)

            if not attrs.exists():
                print('No required paired element matching path: {} for attribute: {}'.format(val, row['BuildingSyncPath']))
                errors.append('No required paired element matching path: {} for attribute: {}'.format(val, row['BuildingSyncPath']))
                continue
            elif attrs.count() != 1:
                print('More than one attribute found matching paired element path: {}'.format(val))
                errors.append('More than one attribute found matching paired element path: {}'.format(val))
                continue

            print("ADDING: {}".format(attrs[0]))

            e = UseCaseRequiredPairedElement(
                use_case_attribute=rec,
                paired_attribute=attrs[0]
            )
            e.save()

    return errors
