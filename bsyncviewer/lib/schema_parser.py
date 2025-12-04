import xmlschema
from django.db import transaction

from bsyncviewer.models.attribute import Attribute
from bsyncviewer.models.attribute_enumeration_class import AttributeEnumerationClass
from bsyncviewer.models.enumeration import Enumeration, EnumerationClass
from lxml import etree
from typing import List

class SchemaEntry():
    name: str
    description: str
    path: str
    type: str
    parent_path: str
    tree_level: str

    def __init__(self, name, path, type, parent_path, tree_level, description=None):
        self.name=name
        self.path=path
        self.type=type
        self.parent_path=parent_path
        self.tree_level=tree_level
        self.description=description


class BuildingSyncSchemaProcessor:
    def __init__(self, schema_path):
        self.schema_tree = etree.parse(schema_path)
        self.namespaces = self.schema_tree.getroot().nsmap


    def get_schema_entries(self) -> List[SchemaEntry]:
        buildingsync_element = self.schema_tree.getroot().xpath(f"*[@name='BuildingSync']", namespaces=self.namespaces)[0]
        return [
            {
                "name": e.name,
                "description": e.description if e.description else "",
                "path": e.path,
                "type": e.type,
                "parent_path": e.parent_path,
                "$$treeLevel": e.tree_level,
            } 
            for e in self._get_schema_entries(buildingsync_element)
        ]


    def _get_schema_entries(self, current_element: etree.Element, parent_path: str = "") -> List[SchemaEntry]:
        entries = []

        # add current
        current_element_entry = None
        ## if Named Element
        if current_element.tag.endswith("element") and "name" in current_element.attrib:
            name = current_element.attrib["name"]
            current_element_entry = SchemaEntry(
                name=name,
                path=parent_path + ("." if parent_path else "") + name,
                type="Named Element",
                parent_path=parent_path,
                tree_level=parent_path.count('.') + 1,
            )
        ## if Enumeration
        elif current_element.tag.endswith("enumeration"):
            name = current_element.attrib["value"]
            current_element_entry = SchemaEntry(
                name=name,
                path=parent_path,
                type="Enumeration",
                parent_path=parent_path,
                tree_level=parent_path.count('.') + 1,
            )
        # if Annotation/documentation
        elif current_element.tag.endswith("annotation") or current_element.tag.endswith("documentation"):
            raise ValueError("These should have been excluded from further recursion one level ago.")
        else:
            # all the other tags dont require an entry, but may have children, types, or references
            # that do, which are handled below. Other tags are: ref, complexType, simpleType,
            # attribute, annotation, import, sequence, schema, restriction, simpleContent,
            # extension, choice, minInclusive, maxInclusive, pattern, union.
            pass

        # separate out the annotations from the rest of the children
        annotation_children = current_element.xpath("./xs:annotation", namespaces=self.namespaces)
        rest_of_children = current_element.xpath("./*[not(self::xs:annotation)]", namespaces=self.namespaces)

        #  if current_element_entry, add annoatations, add it to entries, and update the path, else, keep trucking 
        if current_element_entry is not None:
            if current_element_entry and annotation_children:
                current_element_entry.description = "\n".join([
                    "\n".join([d.text for d in anno.getchildren()])
                    for anno in annotation_children
                ])
            entries.append(current_element_entry)

            current_path = current_element_entry.path
        else:
            current_path = parent_path

        #  if type, get schema entries for type
        if current_element.attrib.get("type", "").startswith("auc:"):
            ref = current_element.attrib["type"].split(":")[-1]
            referenced_element = self.schema_tree.xpath(f"*[@name='{ref}'][not(@type='auc:{ref}')]", namespaces=self.namespaces)[0]
            entries.extend(self._get_schema_entries(referenced_element, current_path))

        #  if ref, get schema entries for ref
        if current_element.attrib.get("ref", "").startswith("auc:"):
            ref = current_element.attrib["ref"].split(":")[-1]
            referenced_element = self.schema_tree.xpath(f"*[@name='{ref}'][not(@ref='auc:{ref}')]", namespaces=self.namespaces)[0]
            entries.extend(self._get_schema_entries(referenced_element, parent_path))

        # get schema entries for children
        for child in rest_of_children:
             entries.extend(self._get_schema_entries(child, current_path))

        return entries


def get_parent_from_path(root_path, schema):
    parents = Attribute.objects.filter(path=root_path, schema=schema)
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
    bs_processor = BuildingSyncSchemaProcessor(schema_object.schema_file.path)
    schema_entries = bs_processor.get_schema_entries()

    # Create database entries for each schema entry
    with transaction.atomic():
        for se in schema_entries:
            # skip all the enumerations until after all the types have been added
            if se["type"] == "Enumeration":
                continue

            # print('----')
            # print(se)

            # add 1 to tree level to account for root
            b = Attribute(
                name=se["name"],
                description=se["description"],
                type=se["type"],
                tree_level=(se["$$treeLevel"] + 1),
                parent=get_parent_from_path(se["parent_path"], schema_object),
                path=se["path"],
                schema=schema_object,
            )
            b.save()

    enumeration_names = {}
    for se in schema_entries:
        # go through all the enumerations and figure out what the unique name should be. In
        # some cases, the last element is enough, but that may not work for items such as
        # ClimateZone which exists for CBECS, ASHRAE, CEC, etc... so these would resolve as
        # CBECS ClimateZone
        if se["type"] == "Enumeration":
            first_class = se["path"].split(".")[-1]
            second_class = " ".join(se["path"].split(".")[-2:-1])

            if not enumeration_names.get(first_class, None):
                enumeration_names[first_class] = set()

            enumeration_names[first_class].add(second_class)
            se["first_class"] = first_class
            se["second_class"] = second_class

    with transaction.atomic():
        for se in schema_entries:
            if se["type"] == "Enumeration":
                attribs = Attribute.objects.filter(
                    path=se["path"], schema=schema_object
                )

                # create the name of the enumeration class
                enum_class_name = se["first_class"]
                if len(enumeration_names[enum_class_name]) > 1:
                    enum_class_name = "%s::%s" % (se["second_class"], se["first_class"])

                # there should only exist one enum class per schema
                ec, _ = EnumerationClass.objects.get_or_create(
                    name=enum_class_name, schema=schema_object
                )

                if len(attribs) == 1:
                    en, _ = Enumeration.objects.get_or_create(
                        schema=schema_object, enumeration_class=ec, name=se["name"]
                    )

                    # associate the attribute with the class
                    AttributeEnumerationClass.objects.get_or_create(
                        attribute=attribs[0], enumeration_class=ec
                    )
                elif len(attribs) > 1:
                    print("More than one enumeration path for %s" % se["full_path"])
                else:
                    print("Could not find enumeration path for %s" % se["full_path"])

    return schema_object
