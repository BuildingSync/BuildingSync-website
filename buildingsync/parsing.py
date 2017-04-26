import os

from schemas.schema2.structure import GDSClassesMapping


def get_uc_items_from_list(list):
    return sorted([x for x in list if x[0].isupper()])


def get_node(classname, current_path='', current_level=0):
    # update the current path string for this level
    if current_level > 0:
        current_path += "."
    current_path += classname
    if classname not in GDSClassesMapping:
        # if not classname.endswith("Type"):
        return {"name": current_path, "$$treeLevel": current_level, "required": False, "optional": False, "auditor": False, "energymodeler": False}
    class_key = classname
    this_class = GDSClassesMapping[class_key]
    class_instance = this_class()
    all_keys = class_instance.__dict__.keys()
    uc_keys = get_uc_items_from_list(all_keys)
    current_return = [{"name": current_path, "$$treeLevel": current_level, "required": False, "optional": False, "auditor": False, "energymodeler": False}]
    for uc_key in uc_keys:
        these_objects = get_node(uc_key, current_path, current_level + 1)
        if these_objects:
            if isinstance(these_objects, dict):
                current_return.append(these_objects)
            else:
                current_return.extend(these_objects)
    return current_return


this_dir = os.path.dirname(os.path.abspath(__file__))
