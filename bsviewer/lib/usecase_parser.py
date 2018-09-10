import csv
from bsviewer.models.use_case_attribute import UseCaseAttribute, UseCaseEnumeration, STATE_TYPES
from bsviewer.models.attribute import Attribute


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
    for row in reader:

        # get attribute reference
        results = Attribute.objects.filter(path=row['BuildingSyncPath'], schema=use_case_object.schema)

        if not results.exists():
            errors.append('No attribute matching path: {}'.format(row['BuildingSyncPath']))
            continue
        elif results.count() != 1:
            errors.append('More than one attribute found matching path: {}'.format(row['BuildingSyncPath']))
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
