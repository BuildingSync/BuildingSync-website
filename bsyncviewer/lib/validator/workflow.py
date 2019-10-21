from collections import OrderedDict

import xmlschema
import xmltodict
import copy

from bsyncviewer.models.schema import Schema
from bsyncviewer.models.use_case import UseCase
from bsyncviewer.models.use_case_attribute import UseCaseAttribute, UseCaseUDF, UseCaseRequiredPairedElement, UseCaseAttributeEnumeration


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

        # parse xml with xmltodict (incorrect when using the to_dict function from schema parsing)
        with open(self.filepath) as file:
            # ignore auc namespace
            # TODO: store namespaces somewhere when there are more than one version of the schema
            namespaces = {'http://buildingsync.net/schemas/bedes-auc/2019': None}
            self.xml = xmltodict.parse(file.read(), process_namespaces=True, namespaces=namespaces)

        for use_case in self.use_cases:
            print("validating use case: {}".format(use_case.name))
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

    # from SEED codebase but doesn't work here
    # def _get_node(self, path, node, results=[], kwargs={}):
    #     """
    #     Return the values from a dictionary based on a path delimited by periods. If there
    #     are more than one results, then it will return all the results in a list.

    #     The method handles nodes that are either lists or either dictionaries. This method is
    #     recursive as it nagivates the tree.

    #     :param path: string, path which to navigate to in the dictionary
    #     :param node: dict, dictionary to process
    #     :param results: list or value, results
    #     :return: list, results
    #     """
    #     original_path = copy.copy(path)

    #     path = path.split(".")

    #     for idx, p in enumerate(path):

    #         if p == '':
    #             if node:
    #                 results.append(node)
    #             break
    #         elif idx == len(path) - 1:
    #             value = node.get(p)
    #             if value:
    #                 results.append(node.get(p))
    #             break
    #         else:
    #             new_node = node.get(path.pop(0))
    #             new_path = '.'.join(path)
    #             if isinstance(new_node, list):
    #                 # grab the values from each item in the list or iterate
    #                 for nn in new_node:
    #                     self._get_node(new_path, nn, results)
    #                 break
    #             elif isinstance(new_node, dict):
    #                 self._get_node(new_path, new_node, results)
    #                 break
    #             else:
    #                 # can't recurse futher into new_node because it is not a dict
    #                 break
    #
    #     if len(results) == 0:
    #         return []
    #     elif len(results) == 1:
    #         return results[0]
    #     else:
    #         return results

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

    def process_use_case_groups(self, use_case, errors):
        # process required-1 and optional-1 groups
        attrs = UseCaseAttribute.objects.filter(state__gt=2, group_id__isnull=False, use_case=use_case).order_by('group_id')
        group_num = 0
        group_level = ''
        match_cnt = 0
        state = 0
        req_paths = []

        def _error_check(state, match_cnt, group_level, req_paths):
            # see if errors occurred
            # if required-1 and match > 1 error: too many at level X
            # if required-1 and match == 0 error: one-of x,y,z required at level X
            # if optional-1 and match > 1 error: too many at level X
            error = None
            req_str = ", "
            req_str = req_str.join(req_paths)
            if state == 3:
                # Required-1
                if match_cnt > 1:
                    msg = 'Required-1 error: multiple elements found, but there should be only one of the following: ' + req_str
                    error = {'path': group_level, 'message': msg}
                elif match_cnt == 0:
                    msg = 'Required-1 error: one of the following elements is required: ' + req_str
                    error = {'path': group_level, 'message': msg}
            elif state == 4 and match_cnt > 1:
                # Optional-1, but more than 1 selected
                msg = 'Optional-1 error: multiple elements found, but there should be 0 or 1 of the following: ' + req_str
                error = {'path': group_level, 'message': msg}
            return error

        for attr in attrs:
            if group_num != attr.group_id and group_num > 0:
                error = _error_check(state, match_cnt, group_level, req_paths)
                if error is not None:
                    errors.append(error)

            # reset group number and match count
            if group_num != attr.group_id:
                group_num = attr.group_id
                match_cnt = 0
                state = attr.state
                group_level = attr.grouping_level
                req_paths = []

            # find a match
            req_paths.append(attr.attribute.path)
            found, the_path = self.find_path_in_schema(attr.attribute.path)
            if found:
                match_cnt += 1

        # error_check for last group
        error = _error_check(state, match_cnt, group_level, req_paths)
        if error is not None:
            errors.append(error)

        return errors

    def process_use_case(self, use_case):
        results = OrderedDict()
        results['valid'] = True
        results['errors'] = []

        # get all attributes of use case where state > 0
        # 1 = Optional, 2 = Required, 3 = Required-1, 4 = Optional-1.
        # validate allowable values and required paired elements in this loop, but not groups
        attrs = UseCaseAttribute.objects.filter(state__gt=0, use_case=use_case)

        # traverse use case attributes (not xml)
        for attr in attrs:
            # try to find it
            paths = copy.deepcopy(attr.attribute.path.split("."))

            # special case: UDF
            # print("ATTR PATH: {}".format(attr.attribute.path))
            if 'UserDefinedField.FieldName' in attr.attribute.path:
                # retrieve all FieldNames from UseCaseUDF
                udfFields = UseCaseUDF.objects.filter(use_case_attribute=attr)
                # remove the last path (FIELDNAME)
                paths = paths[:-1]

                for udf in udfFields:
                    # also retrieve matching FieldValue
                    associatedFieldValue = UseCaseUDF.objects.get(pk=udf.associated_field.pk)
                    # print("UDF values: {}".format(udf.values))

                    # print("PATHS: {}".format(paths))
                    # back up path 1 level to get both fieldName and FieldValue
                    path_found, the_path = self.find_path_in_schema(attr.attribute.path.replace('.FieldName', ''))
                    # print("PATH FOUND: {}.  The path: {}".format(path_found, the_path))
                    if not path_found and attr.state == 2:
                        msg = 'Required UDF element not found with FieldName = ' + udf.values
                        results['errors'].append(
                            {'path': attr.attribute.path, 'message': msg})
                        continue

                    elif path_found:
                        # If found, check that it has correct value
                        # not sure if it's a list if only one is found
                        match = False
                        if the_path.__class__.__name__ == 'OrderedDict':

                            if the_path['FieldName'] == udf.values:
                                # print("FOUND MATCH!")
                                match = True
                                # now check field Value
                                if associatedFieldValue.values and the_path['FieldValue'] not in associatedFieldValue.values:
                                    # enum not matching
                                    msg = 'FieldValue for FieldName =  ' + udf.values + ' contains a value that is not allowed'
                                    results['errors'].append(
                                        {'path': attr.attribute.path, 'message': msg})
                        else:
                            # print("LIST")
                            for index, l in enumerate(the_path):
                                # print("elem: {}".format(l))
                                if l['FieldName'] == udf.values:
                                    # print("FOUND MATCH!")
                                    match = True
                                    # now check field Value
                                    if associatedFieldValue.values and l['FieldValue'] not in associatedFieldValue.values:
                                        # enum not matching
                                        msg = 'FieldValue for FieldName =  ' + udf.values + ' contains a value that is not allowed'
                                        results['errors'].append(
                                            {'path': attr.attribute.path, 'message': msg})

                        if not match and udf.state == 2:
                            msg = 'Required UDF element not found with FieldName = ' + udf.values
                            results['errors'].append(
                                {'path': attr.attribute.path, 'message': msg})

            elif 'UserDefinedField.FieldValue' in attr.attribute.path:
                # skip, taken care of above
                continue
            else:
                # see if path is even there
                # validate presence of required element
                path_found, the_path = self.find_path_in_schema(attr.attribute.path)

                # print("path_found: {}, the path: {}".format(path_found, the_path))
                if not path_found and attr.state == 2:
                    # Required attribute, error out
                    results['errors'].append(
                        {'path': attr.attribute.path, 'message': 'Required element not found'})
                    continue

                elif path_found:
                    # if path was found, validate required paired elements and required_values
                    # validate required_values / enums here -- in the case that the Use Case's allowable enum values is a subset of the schema's
                    req_vals = list(UseCaseAttributeEnumeration.objects.filter(use_case_attribute=attr).values_list('enumeration', flat=True))
                    if len(req_vals) > 0:
                        # print("req_vals: {}".format(req_vals))
                        # print("the_path: {}".format(the_path))
                        # print("last_path: {}".format(paths[-1]))

                        req_str = ", "
                        req_str = req_str.join(req_vals)

                        # if the_path is a dict, then look up by last_path name
                        if the_path.__class__.__name__ == 'OrderedDict':
                            # print("IT IS AN ORDERED DICT!")

                            # make sure value in xml is in the list of valid enums
                            if the_path[paths[-1]].lower() not in [x.lower() for x in req_vals]:
                                msg = "Value " + the_path[paths[-1]] + " is not in the list of enums: " + req_str
                                print(msg)
                                results['errors'].append({'path': attr.attribute.path, 'message': msg})

                        elif isinstance(the_path, str):
                            # it's a single string
                            # print("IT IS A SINGLE STRING")
                            if the_path.lower() not in [x.lower() for x in req_vals]:
                                msg = "Value " + the_path + " is not in the list of enums: " + req_str
                                print(msg)
                                results['errors'].append({'path': attr.attribute.path, 'message': msg})

                        else:
                            # the_path is a list of values (no paths): validate each separately
                            # print("IT IS A LIST!")
                            fail = False
                            fail_val = None
                            for x in the_path:
                                # x could be a value or an ordered dict
                                if x.__class__.__name__ == 'OrderedDict':
                                    # print('YAY! an ordered dict within the list!')
                                    # just check the first key..there should only be one?
                                    if list(x.keys())[0].lower() not in [x.lower() for x in req_vals]:
                                        fail = True
                                        fail_val = list(x.keys())[0]
                                        # print("FAILING VAL: {}".format(fail_val))
                                else:
                                    if x.lower() not in [x.lower() for x in req_vals]:
                                        fail = True
                                        fail_val = x
                                        # print("FAILING VAL: {}".format(fail_val))
                            if fail:
                                msg = "Value " + fail_val + " is not in the list of enums: " + req_str
                                print(msg)
                                results['errors'].append({'path': attr.attribute.path, 'message': msg})

                    # validate required paired element(s)
                    req_elems = UseCaseRequiredPairedElement.objects.filter(use_case_attribute=attr)
                    for req_el in req_elems:
                        # find the element path
                        el_path_found, el_path = self.find_path_in_schema(req_el.paired_attribute.path)
                        # add error if not there
                        if not el_path_found:
                            msg = 'required paired element path: ' + req_el.paired_attribute.path + ' not found'
                            print(msg)
                            results['errors'].append(
                                {'path': attr.attribute.path, 'message': msg})

        results['errors'] = self.process_use_case_groups(use_case, results['errors'])

        # set valid to valse if errors.count > 0
        if len(results['errors']) > 0:
            results['valid'] = False

        return results
