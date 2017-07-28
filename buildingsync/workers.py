import xmlschema

from buildingsync.models import Schema, BuildingSyncAttribute

SCHEMA_NAME = "BuildingSync, Version 2.0.0"
SCHEMA_VERSION = 2


class BuildingSyncSchemaElement(object):
    def __init__(self):
        pass


class BuildingSyncSchemaRoot(BuildingSyncSchemaElement):
    def __init__(self):
        super(BuildingSyncSchemaRoot, self).__init__()
        self.named_elements = []
        self.ref_elements = []
        self.complex_types = []
        self.simple_types = []
        self.attributes = []


class ReferenceElement(BuildingSyncSchemaElement):
    def __init__(self):
        super(ReferenceElement, self).__init__()
        self.attributes = []
        self.annotations = []
        self.ref_type = None


class NamedElement(BuildingSyncSchemaElement):
    def __init__(self):
        super(NamedElement, self).__init__()
        self.annotations = []
        self.complex_types = []
        self.simple_types = []
        self.name = ""
        self.type = None
        self.max_occurs = None
        self.min_occurs = None


class AnnotationElement(BuildingSyncSchemaElement):
    def __init__(self):
        super(AnnotationElement, self).__init__()
        self.documentation = ""


class AttributeElement(BuildingSyncSchemaElement):
    def __init__(self):
        super(AttributeElement, self).__init__()
        self.simple_types = []
        self.annotations = []


class ComplexTypeElement(BuildingSyncSchemaElement):
    def __init__(self):
        super(ComplexTypeElement, self).__init__()
        self.sequences = []
        self.simple_contents = []
        self.attributes = []
        self.choices = []


class SequenceElement(BuildingSyncSchemaElement):
    def __init__(self):
        super(SequenceElement, self).__init__()
        self.named_elements = []
        self.ref_elements = []


class SimpleContentElement(BuildingSyncSchemaElement):
    def __init__(self):
        super(SimpleContentElement, self).__init__()
        self.extensions = []


class ExtensionElement(BuildingSyncSchemaElement):
    def __init__(self):
        super(ExtensionElement, self).__init__()
        self.attributes = []
        self.base_type = None


class SimpleTypeElement(BuildingSyncSchemaElement):
    def __init__(self):
        super(SimpleTypeElement, self).__init__()
        self.restrictions = []


class RestrictionElement(BuildingSyncSchemaElement):
    def __init__(self):
        super(RestrictionElement, self).__init__()
        self.enumerations = []


class ChoiceElement(BuildingSyncSchemaElement):
    def __init__(self):
        super(ChoiceElement, self).__init__()
        self.named_elements = []
        self.ref_elements = []


class BuildingSyncSchemaProcessor(object):
    def __init__(self, xml_schema_instance):
        """
        Creates a new BuildingSync schema processor.  The schema has already been *parsed* by the XMLSchema library.
        This class manages processing the complex data structure into a state targeted for BuildingSync schema specifics
        :param xml_schema_instance: An xmlschema.XMLSchema instance ready to process
        """
        self.xml_schema_structure = xml_schema_instance
        self.type_definitions = []
        self.all_named_elements = []
        self.all_complex_elements = []
        self.type_references = []
        self.named_complex_types = {}
        self.full_schema = self._read_schema(self.xml_schema_structure.root)
        self.check_all_type_references()

    def check_all_type_references(self):
        for type_ref in self.type_references:
            looking_for_type_name = type_ref.ref_type.split(':')[1]  # it starts with the namespace 'auc:'
            found = False
            for ne in self.all_named_elements:
                if looking_for_type_name == ne.name:
                    found = True
                    break
            if found:
                continue
            raise Exception("Couldn't find reference %s" % looking_for_type_name)
        print("All type refs were properly accounted.")

    def _read_schema(self, root_element):
        full_schema = BuildingSyncSchemaRoot()
        for child in root_element.getchildren():
            if child.tag.endswith('element'):
                if 'name' in child.attrib:
                    full_schema.named_elements.append(self._read_named_element(child))
                elif 'ref' in child.attrib:
                    full_schema.ref_elements.append(self._read_ref_element(child))
                else:
                    raise Exception("Invalid element type in _read_schema, no name or ref in attrib...")
            elif child.tag.endswith('complexType'):
                full_schema.complex_types.append(self._read_complex_type(child))
            elif child.tag.endswith('simpleType'):
                full_schema.simple_types.append(self._read_simple_type(child))
            elif child.tag.endswith('attribute'):
                full_schema.attributes.append(self._read_attribute(child))
            else:
                raise Exception("Invalid tag type in _read_schema: " + child.tag)
        return full_schema

    def _read_ref_element(self, parent_object):
        ref_element = ReferenceElement()
        ref_element.ref_type = parent_object.attrib['ref']
        for child in parent_object.getchildren():
            if child.tag.endswith('attribute'):
                ref_element.attributes.append(self._read_attribute(child))
            elif child.tag.endswith('annotation'):
                ref_element.annotations.append(self._read_annotation(child))
            else:
                raise Exception("Invalid tag type in _read_ref_element: " + child.tag)
        self.type_references.append(ref_element)
        return ref_element

    def _read_named_element(self, parent_object):
        named_element = NamedElement()
        named_element.name = parent_object.attrib['name']
        if 'type' in parent_object.attrib:
            named_element.type = parent_object.attrib['type']
        if 'minOccurs' in parent_object.attrib:
            named_element.min_occurs = parent_object.attrib['minOccurs']
        if 'maxOccurs' in parent_object.attrib:
            named_element.max_occurs = parent_object.attrib['maxOccurs']
        for child in parent_object.getchildren():
            if child.tag.endswith('annotation'):
                named_element.annotations.append(self._read_annotation(child))
            elif child.tag.endswith('complexType'):
                named_element.complex_types.append(self._read_complex_type(child))
            elif child.tag.endswith('simpleType'):
                named_element.simple_types.append(self._read_simple_type(child))
            else:
                raise Exception("Invalid tag type in _read_named_element: " + child.tag)
        if named_element.type:
            self.type_definitions.append(named_element)
        self.all_named_elements.append(named_element)
        return named_element

    @staticmethod
    def _read_annotation(parent_object):
        annotation = AnnotationElement()
        for child in parent_object.getchildren():
            if child.tag.endswith('documentation'):
                annotation.documentation = child.text
            else:
                raise Exception("Invalid tag type in _read_annotation: " + child.tag)
        return annotation

    def _read_attribute(self, parent_object):
        attribute = AttributeElement()
        for child in parent_object.getchildren():
            if child.tag.endswith('simpleType'):
                attribute.simple_types.append(self._read_simple_type(child))
            elif child.tag.endswith('annotation'):
                attribute.annotations.append(self._read_annotation(child))
            else:
                raise Exception("Invalid tag type in _read_attribute: " + child.tag)
        return attribute

    def _read_complex_type(self, parent_object):
        this_complex_type = ComplexTypeElement()
        for child in parent_object.getchildren():
            if child.tag.endswith('sequence'):
                this_complex_type.sequences.append(self._read_sequence(child))
            elif child.tag.endswith('simpleContent'):
                this_complex_type.simple_contents.append(self._read_simple_content(child))
            elif child.tag.endswith('attribute'):
                this_complex_type.attributes.append(self._read_attribute(child))
            elif child.tag.endswith('choice'):
                this_complex_type.choices.append(self._read_choice(child))
            else:
                raise Exception("Invalid tag type in _read_complex_type: " + child.tag)
        if 'name' in parent_object.attrib:
            self.named_complex_types[parent_object.attrib['name']] = this_complex_type
            self.all_complex_elements.append(this_complex_type)
        return this_complex_type

    def _read_sequence(self, parent_object):
        this_sequence = SequenceElement()
        for child in parent_object.getchildren():
            if child.tag.endswith('element'):
                if 'name' in child.attrib:
                    this_sequence.named_elements.append(self._read_named_element(child))
                elif 'ref' in child.attrib:
                    this_sequence.ref_elements.append(self._read_ref_element(child))
                else:
                    raise Exception("Invalid element type in _read_sequence, no name or ref in attrib...")
            else:
                raise Exception("Invalid tag type in _read_sequence: " + child.tag)
        return this_sequence

    def _read_simple_content(self, parent_object):
        this_simple_content = SimpleContentElement()
        for child in parent_object.getchildren():
            if child.tag.endswith('extension'):
                this_simple_content.extensions.append(self._read_extension(child))
            else:
                raise Exception("Invalid tag type in _read_simple_content: " + child.tag)
        return this_simple_content

    def _read_extension(self, parent_object):
        this_extension = ExtensionElement()
        if 'base' in parent_object.attrib:
            this_extension.base_type = parent_object.attrib['base']
        for child in parent_object.getchildren():
            if child.tag.endswith('attribute'):
                this_extension.attributes.append(self._read_attribute(child))
            else:
                raise Exception("Invalid tag type in _read_extension: " + child.tag)
        return this_extension

    def _read_simple_type(self, parent_object):
        this_simple_content = SimpleTypeElement()
        for child in parent_object.getchildren():
            if child.tag.endswith('restriction'):
                this_simple_content.restrictions.append(self._read_restriction(child))
            else:
                raise Exception("Invalid tag type in _read_simple_type: " + child.tag)
        return this_simple_content

    @staticmethod
    def _read_restriction(parent_object):
        this_restriction = RestrictionElement()
        for child in parent_object.getchildren():
            if child.tag.endswith('enumeration'):
                this_restriction.enumerations.append(child.attrib['value'])
            else:
                raise Exception("Invalid tag type in _read_restriction: " + child.tag)
        return this_restriction

    def _read_choice(self, parent_object):
        this_choice = ChoiceElement()
        for child in parent_object.getchildren():
            if child.tag.endswith('element'):
                if 'name' in child.attrib:
                    this_choice.named_elements.append(self._read_named_element(child))
                elif 'ref' in child.attrib:
                    this_choice.ref_elements.append(self._read_ref_element(child))
                else:
                    raise Exception("Invalid element type in _read_schema, no name or ref in attrib...")
            else:
                raise Exception("Invalid tag type in _read_choice: " + child.tag)
        return this_choice

    def walk_root_element(self):
        start_with_audits = True
        if start_with_audits:
            a, return_rows, b = self._walk_named_element(self.full_schema.named_elements[0], "audits", 0, 0, "")
            return return_rows
        else:
            return self._walk_schema(self.full_schema, "root", 0, 0, "")

    def _walk_schema(self, parent_element, root_path, current_tree_level, current_index, prefix):
        return_rows = []
        num_added = 0
        for elem in parent_element.named_elements:
            # named elements are tricky, since we walk it to find the documentation before actually adding it
            # so: don't do the usual current_index, append, etc first; instead:
            #  increment the current_index when we pass it into the walker function, since it will actually be one above
            #  then increment the local current_index by one and add the current node
            #  then add all the rows found during the walkabout
            this_num_added, new_rows, potential_doc_string = self._walk_named_element(elem, root_path + '.' + elem.name,
                                                                                      current_tree_level + 1,
                                                                                      current_index + 1, prefix + "- ")
            current_index += 1
            num_added += 1
            if not potential_doc_string:
                potential_doc_string = "*No Documentation Found*"
            return_rows.append({'name': prefix + elem.name + ' {%s}' % potential_doc_string,
                                'type': str(NamedElement),
                                'path': root_path + '.' + elem.name,
                                '$$treeLevel': current_tree_level,
                                'index': current_index})
            current_index += this_num_added
            num_added += this_num_added
            return_rows.extend(new_rows)
        for elem in parent_element.ref_elements:
            current_index += 1
            num_added += 1
            return_rows.append({'name': prefix + elem.ref_type,
                                'type': str(ReferenceElement),
                                'path': root_path + '.' + elem.ref_type,
                                '$$treeLevel': current_tree_level,
                                'index': current_index})
            this_num_added, new_rows, potential_doc_string = self._walk_reference_element(elem)
            current_index += this_num_added
            num_added += this_num_added
            return_rows.extend(new_rows)
        return return_rows

    def _walk_named_element(self, parent_element, root_path, current_tree_level, current_index, prefix):
        return_rows = []
        num_added = 0
        potential_doc_string = None
        for elem in parent_element.annotations:
            potential_doc_string = self._walk_annotation_element(elem)
        for elem in parent_element.complex_types:
            this_num_added, new_rows = self._walk_complex_element(elem, root_path + '.' + 'ComplexType',
                                                                  current_tree_level, current_index, prefix + "- ")
            current_index += this_num_added
            num_added += this_num_added
            return_rows.extend(new_rows)
        for elem in parent_element.simple_types:
            this_num_added, new_rows = self._walk_simple_type_element(elem, root_path + '.' + 'SimpleType',
                                                                      current_tree_level, current_index, prefix + "- ")
            current_index += this_num_added
            num_added += this_num_added
            return_rows.extend(new_rows)
        return num_added, return_rows, potential_doc_string

    def _walk_reference_element(self, parent_element):
        return_rows = []
        num_added = 0
        potential_doc_string = None
        for elem in parent_element.annotations:
            potential_doc_string = self._walk_annotation_element(elem)
        return num_added, return_rows, potential_doc_string

    def _walk_complex_element(self, parent_element, root_path, current_tree_level, current_index, prefix):
        return_rows = []
        num_added = 0
        for elem in parent_element.sequences:
            this_num_added, new_rows = self._walk_sequence_element(elem, root_path + '.' + 'Sequence',
                                                                   current_tree_level, current_index, prefix + "- ")
            current_index += this_num_added
            num_added += this_num_added
            return_rows.extend(new_rows)
        return num_added, return_rows

    def _find_referenced_element(self, original_ref_name):
        looking_for_type_name = original_ref_name.split(':')[1]  # it starts with the namespace 'auc:'
        for ne in self.all_named_elements:
            if looking_for_type_name == ne.name:
                return ne
        if looking_for_type_name in self.named_complex_types:
            return self.named_complex_types[looking_for_type_name]
        return None

    def _walk_sequence_element(self, parent_element, root_path, current_tree_level, current_index, prefix):
        return_rows = []
        num_added = 0
        for elem in parent_element.named_elements:
            if elem.type:
                current_index += 1
                num_added += 1
                return_rows.append(
                    {'name': prefix + '%s' % elem.name,
                     'type': elem.type,
                     'path': root_path + '.' + elem.name,
                     '$$treeLevel': current_tree_level,
                     'index': current_index})
                instance = self._find_referenced_element(elem.type)
                if instance:
                    if isinstance(instance, NamedElement):
                        this_num_added, new_rows, potential_doc_string = self._walk_named_element(
                            instance,
                            root_path + '.' + elem.type,
                            current_tree_level + 1,
                            current_index,
                            prefix + "- ")
                    elif isinstance(instance, ComplexTypeElement):
                        this_num_added, new_rows = self._walk_complex_element(instance, root_path + '.' + elem.type,
                                                                              current_tree_level + 1, current_index,
                                                                              prefix + "- ")
                    else:
                        raise Exception(
                            "Couldn't grok the type of the searched reference element; type: %s" % elem.type)
                    current_index += this_num_added
                    num_added += this_num_added
                    return_rows.extend(new_rows)
            else:
                current_index += 1
                num_added += 1
                return_rows.append(
                    {'name': prefix + elem.name,
                     'path': root_path + '.' + elem.name,
                     'type': str(NamedElement),
                     '$$treeLevel': current_tree_level,
                     'index': current_index})
                this_num_added, new_rows, potential_doc_string = self._walk_named_element(elem,
                                                                                          root_path + '.' + elem.name,
                                                                                          current_tree_level + 1,
                                                                                          current_index, prefix + "- ")
                current_index += this_num_added
                num_added += this_num_added
                return_rows.extend(new_rows)  # maybe this section?
        for elem in parent_element.ref_elements:
            current_index += 1
            num_added += 1
            return_rows.append({'name': prefix + elem.ref_type,
                                'path': root_path + '.' + elem.ref_type,
                                'type': str(ReferenceElement),
                                '$$treeLevel': current_tree_level,
                                'index': current_index})
            # this will really just write the annotation, which we eventually don't want, but OK for now
            this_num_added, new_rows, potential_doc_string = self._walk_reference_element(elem)
            current_index += this_num_added
            num_added += this_num_added
            return_rows.extend(new_rows)

            instance = self._find_referenced_element(elem.ref_type)
            if instance:
                if isinstance(instance, NamedElement):
                    this_num_added, new_rows, potential_doc_string = self._walk_named_element(
                        instance,
                        root_path + '.' + elem.ref_type,
                        current_tree_level + 1,
                        current_index,
                        prefix + "- ")
                elif isinstance(instance, ComplexTypeElement):
                    this_num_added, new_rows = self._walk_complex_element(instance, root_path + '.' + elem.ref_type,
                                                                          current_tree_level + 1, current_index,
                                                                          prefix + "- ")
                else:
                    raise Exception(
                        "Couldn't grok the type of the searched reference element; type: %s" % elem.ref_type)
                current_index += this_num_added
                num_added += this_num_added
                return_rows.extend(new_rows)

        return num_added, return_rows

    @staticmethod
    def _walk_annotation_element(parent_element):
        doc_to_show = None
        if parent_element.documentation:
            doc_to_show = parent_element.documentation
        return doc_to_show

    def _walk_simple_type_element(self, parent_element, root_path, current_tree_level, current_index, prefix):
        return_rows = []
        num_added = 0
        for elem in parent_element.restrictions:
            this_num_added, new_rows = self._walk_restriction_element(elem, root_path + '.' + 'Restriction',
                                                                      current_tree_level, current_index,
                                                                      prefix + "- ")
            current_index += this_num_added
            num_added += this_num_added
            return_rows.extend(new_rows)
        return num_added, return_rows

    @staticmethod
    def _walk_restriction_element(parent_element, root_path, current_tree_level, current_index, prefix):
        return_rows = []
        num_added = 0
        for elem in parent_element.enumerations:
            current_index += 1
            num_added += 1
            return_rows.append(
                {'name': prefix + 'Choice: ' + elem,
                 'path': root_path + '.' + 'Enumeration' + ' {%s}' % elem,
                 'type': 'Enumeration',
                 '$$treeLevel': current_tree_level,
                 'index': current_index})
        return num_added, return_rows


def reset_schema():
    # Delete any previous schemas (and attributes??)
    Schema.objects.all().delete()
    BuildingSyncAttribute.objects.all().delete()

    # Create a schema to work with
    s = Schema(name=SCHEMA_NAME, version=SCHEMA_VERSION)
    s.save()

    # parse the schema itself to get all entries
    my_schema = xmlschema.XMLSchema('buildingsync/schemas/BuildingSync_2_0.xsd')
    # root_element = my_schema.root
    # get_node(root_element, "root", 1)

    bs_processor = BuildingSyncSchemaProcessor(my_schema)
    schema_entries = bs_processor.walk_root_element()

    # trimmed_entries = []
    # for se in schema_entries:
    #     trimmed_entries.append({'name': se['name'], 'tree_level': se['$$treeLevel']})

    # Create database entries for each schema entry
    for se in schema_entries:
        b = BuildingSyncAttribute(
            name=se['name'],
            type=se['type'],
            tree_level=se['$$treeLevel'],
            index=se['index'],
            schema=s)
        b.save()

    # Return the schema
    return s
