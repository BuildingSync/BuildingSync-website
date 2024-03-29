import copy
from collections import OrderedDict

import stopit
import xmlschema
from testsuite.validate_sch import validate_schematron

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
        print("validating schema")
        # load selected schema and validate
        if self.schema.schema_file:
            my_schema = xmlschema.XMLSchema(self.schema.schema_file.path, validation='lax')
            # print("SCHEMA PATH: {}".format(self.schema.schema_file.path))
            resp['valid'] = my_schema.is_valid(self.filepath)
            resp['schema_version'] = self.schema.version

            # timeout "to_dict()" after 5 mins and use the less good method of getting errors
            with stopit.ThreadingTimeout(300):

                try:

                    # this returns all errors
                    self.xml_dict, errors = my_schema.to_dict(self.filepath, validation='lax')
                    print("num errors: {}".format(len(errors)))
                    if len(errors) == 0:
                        # valid
                        resp['valid'] = True
                    else:
                        resp['valid'] = False
                        resp['errors'] = self._format_error(errors)

                except xmlschema.validators.exceptions.XMLSchemaValidationError as ex:
                    print("XMLSCHEMA VALIDATION ERROR EXCEPTION")
                    resp['valid'] = False
                    print("EX: {}".format(ex))
                    resp['errors'] = []
                    tmp_err = {'path': ex.path.replace('auc:', ''), 'message': ex.reason}
                    resp['errors'].append(tmp_err)

                except stopit.utils.TimeoutException:
                    print("TIMEOUT EXCEPTION OCCURRED, trying shorter validation method...")
                    try:
                        # this only returns the first error, but it's better than nothing
                        resp['errors'] = my_schema.validate(self.filepath)

                    except xmlschema.validators.exceptions.XMLSchemaValidationError as ex:
                        print("2nd XMLSCHEMA VALIDATION ERROR EXCEPTION")
                        resp['valid'] = False
                        print("EX: {}".format(ex))
                        resp['errors'] = []
                        tmp_err = {'path': ex.path.replace('auc:', ''), 'message': ex.reason}
                        resp['errors'].append(tmp_err)

                    except Exception as e:
                        print("2nd GENERIC EXCEPTION DURING XMLSCHEMA VALIDATION")
                        print("EXCEPTION TYPE: {}, e: {}".format(type(e), e))
                        resp['errors'] = []
                        resp['errors'].append({'path': '', 'message': e})

                except Exception as e:
                    print("GENERIC EXCEPTION DURING XMLSCHEMA VALIDATION")
                    print("EXCEPTION TYPE: {}, e: {}".format(type(e), e))
                    resp['errors'] = []
                    resp['errors'].append({'path': '', 'message': e})

        else:
            resp['valid'] = False
            resp['errors'] = ['There is no schema XSD to validate against']

        return resp

    def _format_error(self, errors):
        res = []
        for err in errors:
            path = err.path.replace('auc:', '')
            reason = err.reason
            warning = None

            if path.split("/")[-1] == "UsefulLife" and reason.startswith("invalid literal for int() with base 10:"):
                warning = "This error is a result of a breaking change between BuildingSync Schema 2.4 and 2.5."
                reason = "Remove the decimal point. (" + reason + ")"

            res.append({'path': path, 'message': reason, "warning": warning})

        return res

    def validate_use_cases(self):
        resp = OrderedDict()
        processed_use_cases = {}
        for use_case in self.use_cases:
            print("Validating use case: {}".format(use_case.name))
            processed_use_cases[use_case.name] = self.process_use_case(use_case)

        # sort by valid then alphabetical
        resp['use_cases'] = OrderedDict(sorted(
            processed_use_cases.items(),
            key=lambda t: f"{not t[1]['valid']} {t[0]}"
        ))

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

        errors = validate_schematron(use_case.import_file.path, self.filepath)
        temp_results = self.process_errors(errors)

        # set valid to valse if errors.count > 0
        if len(temp_results['errors']) > 0:
            results['valid'] = False

        results['warnings'] = temp_results['warnings']
        results['errors'] = temp_results['errors']
        results['infos'] = temp_results['infos']

        return results

    def process_errors(self, failures):
        def format_failure(failure):
            return f'line {failure.line}: element {failure.element}: {failure.message}'

        # separate INFO, WARNING, ERROR

        final_results = OrderedDict()
        final_results['infos'] = []
        final_results['warnings'] = []
        final_results['errors'] = []

        for failure in failures:
            if failure.role == 'INFO':
                # append to info
                final_results['infos'].append(format_failure(failure))
            elif failure.role == 'WARNING':
                # append to warnings
                final_results['warnings'].append(format_failure(failure))
            else:
                # assume error
                final_results['errors'].append(format_failure(failure))

        return final_results
