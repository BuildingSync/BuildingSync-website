from collections import OrderedDict

import xmlschema
import xmltodict
import copy

from bsviewer.models.schema import Schema
from bsviewer.models.use_case import UseCase
from bsviewer.models.use_case_attribute import UseCaseAttribute, UseCaseUDF


class ValidationWorkflow(object):

    def __init__(self, f, filepath, version=0.3):
        """
        Initialize Workflow

        :param f: file-like object of xml data to validate
        :return:
        """

        # file-like object (not using it)
        # TODO: remove?
        self.f = f
        # file path (using this)
        self.filepath = filepath

        # add schema version controls.  Only validate against use cases matching schema version
        self.schema_version = version
        self.schema = Schema.objects.get(version=version)

        self.use_cases = []

        self.xml_dict = dict()

        # retrieve all applicable use cases (public)
        for ucase in UseCase.objects.filter(schema=self.schema, make_public=True):
            self.use_cases.append(ucase)

    def validate_schema(self):
        resp = OrderedDict()
        # load selected schema and validate
        if self.schema.schema_file:
            my_schema = xmlschema.XMLSchema(self.schema.schema_file.path, validation='lax')
            resp['valid'] = my_schema.is_valid(self.filepath)
            print("VALID?: {}".format(resp['valid']))
            resp['schema_version'] = self.schema.version
            try:
                # this only returns the first error
                # resp['errors'] = my_schema.validate(self.filepath)

                # this returns all errors
                self.xml_dict, errors = my_schema.to_dict(self.filepath, validation='lax')
                if len(errors) == 0:
                    # valid
                    resp['valid'] = True
                else:
                    resp['valid'] = False
                    print(" {} schema validation ERRORS found.".format(len(errors)))
                    resp['errors'] = []
                    for err in errors:
                        tmp_err = {'path': err.path.replace('auc:', ''), 'message': err.reason}
                        resp['errors'].append(tmp_err)

            except xmlschema.validators.exceptions.XMLSchemaValidationError as ex:
                resp['valid'] = False
                print("EX: {}".format(ex))
                resp['errors'] = []
                # TODO: this is probably not needed anymore due to the use of 'to_dict' in try block instead of 'validate'
                tmp_err = {'path': ex.path.replace('auc:', ''), 'message': ex.reason}
                resp['errors'].append(tmp_err)

        else:
            resp['valid'] = False
            resp['errors'] = ['There is no schema XSD to validate against']

        return resp

    def validate_use_cases(self):
        resp = OrderedDict()
        resp['use_cases'] = OrderedDict()

        # parse xml with xmltodict (incorrect when using the to_dict function from schema parsing)
        with open(self.filepath) as file:
            self.xml = xmltodict.parse(file.read())

        for use_case in self.use_cases:
            print("validating use case: {}".format(use_case.name))
            resp['use_cases'][use_case.name] = self.process_use_case(use_case)

        return resp

    def validate_all(self):
        resp = OrderedDict()
        schema_resp = self.validate_schema()
        resp['schema'] = schema_resp
        # restore this when you have a valid xml
        # if not schema_resp['valid']:
        #    return resp

        print('VALIDATING USE CASES...')
        resp.update(self.validate_use_cases())
        return resp

    def process_use_case(self, use_case):
        results = OrderedDict()
        results['valid'] = True
        results['errors'] = []

        # get all attributes of use case where state > 0
        # 1 = Optional, 2 = Required
        attrs = UseCaseAttribute.objects.filter(state__gt=0, use_case=use_case)
        # print("NUMBER OF ATTRIBUTES RETRIEVED: {}".format(attrs.count()))

        # traverse use case attributes (not xml)
        for attr in attrs:
            # try to find it
            paths = copy.deepcopy(attr.attribute.path.split("."))
            loopingVar = copy.deepcopy(self.xml)
            # special case: UDF
            if 'UserDefinedField.FieldName' in attr.attribute.path:
                # retrieve all FieldNames from UseCaseUDF
                udfFields = UseCaseUDF.objects.filter(use_case_attribute=attr)
                # remove the last path (FIELDNAME)
                paths = paths[:-1]

                for udf in udfFields:
                    associatedFieldValue = UseCaseUDF.objects.get(pk=udf.associated_field.pk)
                    loopingVar = copy.deepcopy(self.xml)
                    print("UDF values: {}".format(udf.values))
                    # also retrieve matching FieldValue
                    try:
                        print("PATHS: {}".format(paths))
                        for path in paths:
                            fpath = 'auc:' + path
                            if loopingVar.__class__.__name__ == 'OrderedDict':
                                loopingVar = loopingVar[fpath]
                            else:
                                # it's a list
                                for index, l in enumerate(loopingVar):
                                    loopingVar[index] = l[fpath]

                        # If found, check that it has correct value
                        # not sure if it's a list if only one is found
                        match = False
                        if loopingVar.__class__.__name__ == 'OrderedDict':
                            print("ORDERED DICT: {}".format(loopingVar))
                            if loopingVar['auc:FieldName'] == udf.values:
                                print("FOUND MATCH!")
                                match = True
                                # now check field Value
                                if associatedFieldValue.values and l['auc:FieldValue'] not in associatedFieldValue.values:
                                    # enum not matching
                                    msg = 'FieldValue for FieldName =  ' + udf.values + ' contains a value that is not allowed'
                                    results['errors'].append(
                                        {'path': attr.attribute.path, 'message': msg})
                        else:
                            print("LIST")
                            for index, l in enumerate(loopingVar):
                                print("elem: {}".format(l))
                                if l['auc:FieldName'] == udf.values:
                                    print("FOUND MATCH!")
                                    match = True
                                    # now check field Value
                                    if associatedFieldValue.values and l['auc:FieldValue'] not in associatedFieldValue.values:
                                        # enum not matching
                                        msg = 'FieldValue for FieldName =  ' + udf.values + ' contains a value that is not allowed'
                                        results['errors'].append(
                                            {'path': attr.attribute.path, 'message': msg})

                        if not match and udf.state == 2:
                            msg = 'Required UDF element not found with FieldName = ' + udf.values
                            results['errors'].append(
                                {'path': attr.attribute.path, 'message': msg})

                    except BaseException:
                        print("---EXCEPTION!!! ---")
                        if attr.state == 2:
                            # Required attribute, error out
                            msg = 'Required UDF element not found with FieldName = ' + udf.values
                            results['errors'].append(
                                {'path': attr.attribute.path, 'message': msg})
                        # now go to next attribute
                        continue
            elif 'UserDefinedField.FieldValue' in attr.attribute.path:
                # skip, taken care of above
                continue
            else:
                # validate presence of required element
                try:
                    for path in paths:
                        fpath = 'auc:' + path
                        if loopingVar.__class__.__name__ == 'OrderedDict':
                            loopingVar = loopingVar[fpath]
                        else:
                            # it's a list
                            for index, l in enumerate(loopingVar):
                                loopingVar[index] = l[fpath]
                except BaseException:
                    if attr.state == 2:
                        # Required attribute, error out
                        results['errors'].append(
                            {'path': attr.attribute.path, 'message': 'Required element not found'})
                    # now go to next attribute
                    continue

            # TODO: validate enums here -- in the case that the Use Case's allowable enum values is a subset of the schema's
            # other validation (such as value of elements) have been validate via the schema_validation

        # set valid to valse if errors.count > 0
        if len(results['errors']) > 0:
            results['valid'] = False

        return results
