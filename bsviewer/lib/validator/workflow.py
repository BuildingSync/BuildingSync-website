from lxml import etree
import xmlschema
from collections import OrderedDict

from bsviewer.lib.validator.basevalidator import BaseValidator, ValidationError
from bsviewer.models.use_case import UseCase
from bsviewer.models.schema import Schema


class ValidationWorkflow(object):

    def __init__(self, f, filepath, version=0.3):
        """
        Initialize Workflow

        :param f: file-like object of xml data to validate
        :return:
        """

        # file path
        self.filepath = filepath

        # add schema version controls.  Only validate against use cases matching schema version
        self.schema_version = version
        self.schema = Schema.objects.get(version=version)

        try:
            self.xml_root = etree.parse(f).getroot()
        except etree.XMLSyntaxError:
            self.is_xml = False
            return
        else:
            self.is_xml = True
        self.use_cases = []

        # retrieve all applicable use cases
        for ucase in UseCase.objects.filter(schema=self.schema):
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
                xml_dict, errors = my_schema.to_dict(self.filepath, validation='lax')
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
        for use_case in self.use_cases:
            use_case_resp = OrderedDict()
            try:
                #use_case.assert_valid()
                temp = 'hi'
            except ValidationError as ex:
                use_case_resp['valid'] = False
                use_case_resp['errors'] = ex.messages
            else:
                use_case_resp['valid'] = True
            resp[use_case] = use_case_resp
        return resp


    def validate_all(self):
        resp = OrderedDict()
        schema_resp = self.validate_schema()
        resp['Schema'] = schema_resp
        if not schema_resp['valid']:
            return resp
        resp.update(self.validate_use_cases())
        return resp
