import xmlschema

from bsviewer.models.attribute import Attribute
from bsviewer.models.enumeration import Enumeration, EnumerationClass
from bsviewer.models.attribute_enumeration_class import AttributeEnumerationClass
from django.db import transaction


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
        self.annotations = []


class ReferenceElement(BuildingSyncSchemaElement):
    def __init__(self):
        super(ReferenceElement, self).__init__()
        self.attributes = []
        self.annotations = []
        self.ref_type = None

    @staticmethod
    def my_string():
        return "Reference Element"


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

    @staticmethod
    def my_string():
        return "Named Element"


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
        self.choices = []


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
        self.annotations = []


class RestrictionElement(BuildingSyncSchemaElement):
    def __init__(self):
        super(RestrictionElement, self).__init__()
        self.enumerations = []
        self.min_inclusive = 0
        self.max_inclusive = 0


class ChoiceElement(BuildingSyncSchemaElement):
    def __init__(self):
        super(ChoiceElement, self).__init__()
        self.named_elements = []
        self.ref_elements = []
        self.sequences = []


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
            # it starts with the namespace 'auc:'
            if type_ref.ref_type.startswith('auc:'):
                looking_for_type_name = type_ref.ref_type.split(':')[1]
            else:
                looking_for_type_name = type_ref.ref_type
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
                    raise Exception(
                        "Invalid element type in _read_schema, no name or ref in attrib..."
                    )
            elif child.tag.endswith('complexType'):
                full_schema.complex_types.append(self._read_complex_type(child))
            elif child.tag.endswith('simpleType'):
                full_schema.simple_types.append(self._read_simple_type(child))
            elif child.tag.endswith('attribute'):
                full_schema.attributes.append(self._read_attribute(child))
            elif child.tag.endswith('annotation'):
                full_schema.annotations.append(self._read_annotation(child))
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
            # testing if this resolves the issue
            # self.type_references.append(named_element)
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
                    raise Exception(
                        "Invalid element type in _read_sequence, no name or ref in attrib...")
            elif child.tag.endswith('choice'):
                this_sequence.choices.append(self._read_choice(child))
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
            elif child.tag.endswith('annotation'):
                this_simple_content.annotations.append(self._read_annotation(child))
            else:
                raise Exception("Invalid tag type in _read_simple_type: " + child.tag)
        return this_simple_content

    @staticmethod
    def _read_restriction(parent_object):
        this_restriction = RestrictionElement()
        for child in parent_object.getchildren():
            if child.tag.endswith('enumeration'):
                this_restriction.enumerations.append(child.attrib['value'])
            elif child.tag.endswith('minInclusive'):
                this_restriction.min_inclusive = child.attrib['value']
            elif child.tag.endswith('maxInclusive'):
                this_restriction.max_inclusive = child.attrib['value']
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
                    raise Exception(
                        "Invalid element type in _read_schema, no name or ref in attrib...")
            elif child.tag.endswith('sequence'):
                this_choice.choices.append(self._read_sequence(child))
            else:
                raise Exception("Invalid tag type in _read_choice: " + child.tag)
        return this_choice

    def walk_root_element(self):
        a, return_rows, b = self._walk_named_element(
            self.full_schema.named_elements[0], "Audits", 0, 0
        )

        return return_rows

    def _walk_named_element(self, parent_element, root_path, current_tree_level, current_index):
        return_rows = []
        num_added = 0
        potential_doc_string = None

        for elem in parent_element.annotations:
            potential_doc_string = self._walk_annotation_element(elem)

        for elem in parent_element.complex_types:
            this_num_added, new_rows = self._walk_complex_element(
                elem, root_path, current_tree_level, current_index
            )
            current_index += this_num_added
            num_added += this_num_added
            return_rows.extend(new_rows)

        for elem in parent_element.simple_types:
            this_num_added, new_rows = self._walk_simple_type_element(
                elem, root_path, current_tree_level, current_index
            )
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

    def _walk_complex_element(self, parent_element, root_path, current_tree_level, current_index):
        return_rows = []
        num_added = 0
        for elem in parent_element.sequences:
            this_num_added, new_rows = self._walk_sequence_or_choice_element(
                elem, root_path, current_tree_level, current_index
            )
            current_index += this_num_added
            num_added += this_num_added
            return_rows.extend(new_rows)

        for elem in parent_element.choices:
            this_num_added, new_rows = self._walk_sequence_or_choice_element(
                elem, root_path, current_tree_level, current_index
            )
            current_index += this_num_added
            num_added += this_num_added
            return_rows.extend(new_rows)
        return num_added, return_rows

    def _find_referenced_element(self, original_ref_name):
        # it starts with the namespace 'auc:'
        if original_ref_name.startswith('auc:'):
            original_ref_name = original_ref_name.split(':')[1]
        if original_ref_name in self.named_complex_types:
            return self.named_complex_types[original_ref_name]
        for ne in self.all_named_elements:
            if original_ref_name == ne.name:
                return ne
        return None

    def _walk_sequence_or_choice_element(self, parent_element, root_path, current_tree_level,
                                         current_index):
        return_rows = []
        num_added = 0
        for elem in parent_element.named_elements:
            if elem.type:
                current_index += 1
                num_added += 1
                return_rows.append({
                    'name': elem.name,
                    'type': elem.name,
                    'parent_path': root_path,
                    'path': root_path + '.' + elem.name,
                    '$$treeLevel': current_tree_level,
                    'index': current_index
                })
                instance = self._find_referenced_element(elem.type)

                if instance:
                    if isinstance(instance, NamedElement):
                        this_num_added, new_rows, potential_doc_string = self._walk_named_element(
                            instance,
                            root_path + '.' + elem.name,
                            current_tree_level + 1,
                            current_index
                        )
                    elif isinstance(instance, ComplexTypeElement):
                        this_num_added, new_rows = self._walk_complex_element(
                            instance,
                            root_path + '.' + elem.name,
                            current_tree_level + 1,
                            current_index
                        )
                    else:
                        raise Exception(
                            "Couldn't grok the type of the searched reference element; type: %s" % elem.type
                        )
                    current_index += this_num_added
                    num_added += this_num_added
                    return_rows.extend(new_rows)
            else:
                current_index += 1
                num_added += 1
                return_rows.append({
                    'name': elem.name,
                    'path': root_path + '.' + elem.name,
                    'type': NamedElement.my_string(),
                    'parent_path': root_path,
                    '$$treeLevel': current_tree_level,
                    'index': current_index
                })
                this_num_added, new_rows, potential_doc_string = self._walk_named_element(
                    elem,
                    root_path + '.' + elem.name,
                    current_tree_level + 1,
                    current_index
                )
                current_index += this_num_added
                num_added += this_num_added
                return_rows.extend(new_rows)  # maybe this section?

        for elem in getattr(parent_element, 'choices', []):
            this_num_added, new_rows = self._walk_sequence_or_choice_element(
                elem, root_path, current_tree_level, current_index
            )
            current_index += this_num_added
            num_added += this_num_added
            return_rows.extend(new_rows)

        for elem in parent_element.ref_elements:
            current_index += 1
            num_added += 1

            if elem.ref_type.startswith('auc:'):
                ref_type_clean = elem.ref_type.split(':')[1]
            else:
                ref_type_clean = elem.ref_type
            return_rows.append({
                'name': ref_type_clean,
                'path': root_path + '.' + ref_type_clean,
                'type': ReferenceElement.my_string(),
                'parent_path': root_path,
                '$$treeLevel': current_tree_level,
                'index': current_index
            })
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
                        root_path + '.' + ref_type_clean,
                        current_tree_level + 1,
                        current_index
                    )
                elif isinstance(instance, ComplexTypeElement):
                    this_num_added, new_rows = self._walk_complex_element(
                        instance,
                        root_path + '.' + ref_type_clean,
                        current_tree_level + 1,
                        current_index
                    )
                else:
                    raise Exception(
                        "Couldn't grok the type of the searched reference element; type: %s" % elem.ref_type
                    )
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

    def _walk_simple_type_element(self, parent_element, root_path, current_tree_level,
                                  current_index):
        return_rows = []
        num_added = 0
        for elem in parent_element.restrictions:
            this_num_added, new_rows = self._walk_restriction_element(
                elem,
                root_path + '.' + 'Restriction',
                current_tree_level,
                current_index
            )
            current_index += this_num_added
            num_added += this_num_added
            return_rows.extend(new_rows)
        return num_added, return_rows

    @staticmethod
    def _walk_restriction_element(parent_element, root_path, current_tree_level, current_index):
        return_rows = []
        num_added = 0
        for elem in parent_element.enumerations:
            # TODO: Verify that the minInclusive, maxInclusive work here
            current_index += 1
            num_added += 1
            return_rows.append({
                'name': elem,
                'full_path': root_path,
                'path': '.'.join(root_path.split('.')[0:-1]),
                'type': 'Enumeration',
                'parent_path': root_path,
                '$$treeLevel': current_tree_level,
                'index': current_index
            })
        return num_added, return_rows


# def get_parent_from_path(root_path):
#     parts = root_path.split('.')
#     if len(parts) == 1:
#         # root element, no parent
#         return None
#     else:
#         return parts[-1]

def get_parent_from_path(root_path):
    parents = Attribute.objects.filter(path=root_path)
    if parents.count() > 0:
        return parents[0].pk
    else:
        return None


def process_schema(schema_object):
    """
    parse the schema itself to get all entries

    :param schema_object: obj, Schema object as defined by Django
    :return: obj, Schema object
    """
    my_schema = xmlschema.XMLSchema(schema_object.schema_file.path)

    bs_processor = BuildingSyncSchemaProcessor(my_schema)
    schema_entries = bs_processor.walk_root_element()

    # Create database entries for each schema entry
    with transaction.atomic():
        # first add root
        b = Attribute(
            name='Audits',
            type='Named Element',
            tree_level=0,
            index=0,
            path='Audits',
            schema=schema_object)
        b.save()

        for se in schema_entries:
            # skip all the enumerations until after all the types have been added
            if se['type'] == 'Enumeration':
                continue

            # print('----')
            # print(se)

            # add 1 to tree level to account for root
            b = Attribute(
                name=se['name'],
                type=se['type'],
                tree_level=(se['$$treeLevel']+1),
                parent=get_parent_from_path(se['parent_path']),
                index=se['index'],
                path=se['path'],
                schema=schema_object)
            b.save()

    enumeration_names = {}
    for se in schema_entries:
        # go through all the enumerations and figure out what the unique name should be. In
        # some cases, the last element is enough, but that may not work for items such as
        # ClimateZone which exists for CBECS, ASHRAE, CEC, etc... so these would resolve as
        # CBECS ClimateZone
        if se['type'] == 'Enumeration':
            first_class = se['path'].split('.')[-1]
            second_class = ' '.join(se['path'].split('.')[-2:-1])

            if not enumeration_names.get(first_class, None):
                enumeration_names[first_class] = set()

            enumeration_names[first_class].add(second_class)
            se['first_class'] = first_class
            se['second_class'] = second_class

    with transaction.atomic():
        for se in schema_entries:
            if se['type'] == 'Enumeration':
                attribs = Attribute.objects.filter(path=se['path'], schema=schema_object)

                # create the name of the enumeration class
                enum_class_name = se['first_class']
                if len(enumeration_names[enum_class_name]) > 1:
                    enum_class_name = "%s::%s" % (se['second_class'], se['first_class'])

                # there should only exist one enum class per schema
                ec, _ = EnumerationClass.objects.get_or_create(
                    name=enum_class_name, schema=schema_object
                )

                if len(attribs) == 1:
                    en, _ = Enumeration.objects.get_or_create(
                        schema=schema_object,
                        enumeration_class=ec,
                        name=se['name'],
                        index=se['index'],
                    )

                    # associate the attribute with the class
                    AttributeEnumerationClass.objects.get_or_create(
                        attribute=attribs[0], enumeration_class=ec
                    )
                elif len(attribs) > 1:
                    print('More than one enumeration path for %s' % se['full_path'])
                else:
                    print('Could not find enumeration path for %s' % se['full_path'])

    return schema_object
