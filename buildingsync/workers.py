# Step 1: Install Schema Processor:
#   $ pip install generateds

# Step 2: create the Python representation of the schema:
#   $ generateds -o structure.py --use-getter-setter=none BuildingSync_2_0.xsd

# Step 3: import the appropriate database models
from buildingsync.models import Schema, BuildingSyncAttribute

# Step 4: import that structure.py file's class map and set some parameters
from buildingsync.schemas.schema2.structure import GDSClassesMapping as schema_map

SCHEMA_NAME = "BuildingSync, Version 2.0.0"
SCHEMA_VERSION = 2

current_index = 0


def get_node(classname, classmap, current_path='', current_level=0):
    global current_index
    if current_level == 0:
        current_index = 0  # reset it here, if we end up with multiple roots later, this would be problematic
    if current_level > 0:
        current_path += "."
    current_path += classname
    if classname not in classmap:
        current_index += 1
        return {"name": current_path, "$$treeLevel": current_level, "index": current_index}
    class_key = classname
    this_class = classmap[class_key]
    class_instance = this_class()
    all_keys = class_instance.__dict__.keys()
    uc_keys = sorted([x for x in all_keys if x[0].isupper()])
    current_index += 1
    current_return = [{"name": current_path, "$$treeLevel": current_level, "index": current_index}]
    for uc_key in uc_keys:
        these_objects = get_node(uc_key, classmap, current_path, current_level + 1)
        if these_objects:
            if isinstance(these_objects, dict):
                current_return.append(these_objects)
            else:
                current_return.extend(these_objects)
    return current_return


def reset_schema():
    # step 4.5: delete any previous schemas -- and attributes??
    Schema.objects.all().delete()
    BuildingSyncAttribute.objects.all().delete()

    # Step 5: create a schema to work with
    s = Schema(name=SCHEMA_NAME, version=SCHEMA_VERSION)
    s.save()

    # Step 6: call the parsing function to create a list of attributes based on a root node string
    schema_entries = get_node(classname='Site', classmap=schema_map)

    # Step 7: create database entries for each schema entry
    for se in schema_entries:
        b = BuildingSyncAttribute(name=se['name'], tree_level=se['$$treeLevel'], index=se['index'], schema=s)
        b.save()

    # for kicks, if anyone else calls this, just return the schema
    return s
