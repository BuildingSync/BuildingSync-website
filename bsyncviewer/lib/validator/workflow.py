from collections import OrderedDict

import xmlschema
import copy
import subprocess

from bsyncviewer.models.schema import Schema
from bsyncviewer.models.use_case import UseCase


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
            # print("SCHEMA PATH: {}".format(self.schema.schema_file.path))
            resp['valid'] = my_schema.is_valid(self.filepath)
            # print("FILE PATH: {}".format(self.filepath))
            # print("VALID?: {}".format(resp['valid']))
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
                print("XMLSCHEMA VALIDATION ERROR EXCEPTION")
                resp['valid'] = False
                print("EX: {}".format(ex))
                resp['errors'] = []
                # TODO: this is probably not needed anymore due to the use of 'to_dict' in try block instead of 'validate'
                tmp_err = {'path': ex.path.replace('auc:', ''), 'message': ex.reason}
                resp['errors'].append(tmp_err)
            except Exception as e:
                print("GENERIC EXCEPTION DURING XMLSCHEMA VALIDATION")
                print("EXCEPTION TYPE: {}, e: {}".format(type(e), e))
                resp['errors'] = []
                resp['errors'].append({'path': '', 'message': e})

        else:
            resp['valid'] = False
            resp['errors'] = ['There is no schema XSD to validate against']

        return resp

    def validate_use_cases(self):
        resp = OrderedDict()
        resp['use_cases'] = OrderedDict()

        for use_case in self.use_cases:
            print("Validating use case: {}".format(use_case.name))
            resp['use_cases'][use_case.name] = self.process_use_case(use_case)

        return resp

    def validate_all(self):
        resp = OrderedDict()
        schema_resp = self.validate_schema()
        resp['schema'] = schema_resp
        if schema_resp['valid'] is False:
            return resp

        print('VALIDATING USE CASES...')
        resp.update(self.validate_use_cases())
        return resp

    def find_path_in_schema(self, attr_path):

        # try to find path(s) in XML
        paths = copy.deepcopy(attr_path.split("."))
        loopingVar = copy.deepcopy(self.xml)
        found = True

        # print("PATHS:")
        # print(paths)

        try:
            for path in paths:
                # print("CURRENT PATH: {}".format(path))
                fpath = path
                if loopingVar.__class__.__name__ == 'OrderedDict':
                    loopingVar = loopingVar[fpath]
                else:
                    # it's a list
                    # print("THE LIST: {}".format(loopingVar))
                    for index, l in enumerate(loopingVar):

                        if fpath not in l and isinstance(l, list):
                            # add another loop
                            # print("L is a list!")
                            loopingVar = []
                            for x in l:
                                loopingVar.append(x[fpath])
                        else:
                            # print("L is an ordered Dict!")
                            # print("l[fpath]: {}".format(l[fpath]))
                            loopingVar[index] = l[fpath]

        except BaseException:
            found = False

        return found, loopingVar

    def process_use_case(self, use_case):
        results = OrderedDict()
        results['valid'] = True
        results['errors'] = []
        results['infos'] = []
        results['warnings'] = []

        result = subprocess.run(['stron-nokogiri', use_case.import_file.path, self.filepath], stdout=subprocess.PIPE)
        errors = result.stdout.decode('utf-8')
        temp_results = errors.split('\n')
        temp_results = [i for i in temp_results if i]

        temp_results = self.process_errors(temp_results)

        # set valid to valse if errors.count > 0
        if len(temp_results['errors']) > 0:
            results['valid'] = False

        results['warnings'] = temp_results['warnings']
        results['errors'] = temp_results['errors']
        results['infos'] = temp_results['infos']

        return results

    def process_errors(self, results):
        # separate INFO, WARNING, ERROR

        final_results = OrderedDict()
        final_results['infos'] = []
        final_results['warnings'] = []
        final_results['errors'] = []

        for res in results:
            if '[INFO]' in res:
                # append to info
                final_results['infos'].append(res)
            elif '[WARNING]' in res:
                # append to warnings
                final_results['warnings'].append(res)
            else:
                # assume error
                final_results['errors'].append(res)

        return final_results
