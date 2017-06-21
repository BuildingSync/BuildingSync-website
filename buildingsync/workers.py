import xmlschema
from buildingsync.models import Schema, BuildingSyncAttribute

SCHEMA_NAME = "BuildingSync, Version 2.0.0"
SCHEMA_VERSION = 2

current_index = 0
schema_entries = []


def get_node(root_element, root_path):
    """TODO: Change this function to return the current index, and current entries list, so that we remove globals"""
    global schema_entries, current_index
    current_index += 1
    for child in root_element:
        if 'name' in child.attrib:
            this_child_name = child.attrib['name']
            this_child_path = root_path + "." + this_child_name
            schema_entries.append({'$$treeLevel': 1, 'name': this_child_name, 'index': current_index, 'path': this_child_path})
        else:
            this_child_path = root_path + '.' + 'unnamed'
        get_node(child, this_child_path)


def reset_schema():
    global schema_entries

    # Delete any previous schemas (and attributes??)
    Schema.objects.all().delete()
    BuildingSyncAttribute.objects.all().delete()

    # Create a schema to work with
    s = Schema(name=SCHEMA_NAME, version=SCHEMA_VERSION)
    s.save()

    # parse the schema itself to get all entries
    my_schema = xmlschema.XMLSchema('buildingsync/schemas/schema2/BuildingSync_2_0.xsd')
    root_element = my_schema.root
    get_node(root_element, "root")

    # Create database entries for each schema entry
    for se in schema_entries:
        b = BuildingSyncAttribute(name=se['path'], tree_level=se['$$treeLevel'], index=se['index'], schema=s)
        b.save()

    # Return the schema
    return s
