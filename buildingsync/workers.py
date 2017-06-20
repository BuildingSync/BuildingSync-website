import xmlschema
from buildingsync.models import Schema, BuildingSyncAttribute

SCHEMA_NAME = "BuildingSync, Version 2.0.0"
SCHEMA_VERSION = 2

current_index = 0


def reset_schema():
    # Delete any previous schemas (and attributes??)
    Schema.objects.all().delete()
    BuildingSyncAttribute.objects.all().delete()

    # Create a schema to work with
    s = Schema(name=SCHEMA_NAME, version=SCHEMA_VERSION)
    s.save()

    my_schema = xmlschema.XMLSchema('buildingsync/schemas/schema2/BuildingSync_2_0.xsd')
    root_element = my_schema.root
    index = 1
    root_path = 'root'
    schema_entries = [{'$$treeLevel': 0, 'name': 'root', 'index': index, 'path': root_path}]
    # yes, I know, this is going to be a recursive call, I just wanted to lay out a few steps deep to make sure I see the recursion properly
    for child in root_element._children:
        index += 1
        this_child_name = child.attrib['name']
        this_child_path = root_path + "." + this_child_name
        schema_entries.append({'$$treeLevel': 1, 'name': "-   " + this_child_name, 'index': index, 'path': this_child_path})
        for grandchild in child._children:
            index += 1
            if 'name' in grandchild.attrib:
                this_grandchild_name = grandchild.attrib['name']
                this_grandchild_path = this_child_path + "." + this_grandchild_name
                schema_entries.append({'$$treeLevel': 2, 'name': "-   -   " + this_grandchild_name, 'index': index, 'path': this_grandchild_path})
            else:
                this_grandchild_path = this_child_path + "." + "unnamed"
            for greatgrandchild in grandchild._children:
                index += 1
                if 'name' in greatgrandchild.attrib:
                    this_greatgrandchild_name = greatgrandchild.attrib['name']
                    this_greatgrandchild_path = this_grandchild_path + "." + this_greatgrandchild_name
                    schema_entries.append(
                        {'$$treeLevel': 2, 'name': "-   -   -   " + this_greatgrandchild_name, 'index': index,
                         'path': this_greatgrandchild_path})

    # Create database entries for each schema entry
    for se in schema_entries:
        b = BuildingSyncAttribute(name=se['path'], tree_level=se['$$treeLevel'], index=se['index'], schema=s)
        b.save()

    # Return the schema
    return s
