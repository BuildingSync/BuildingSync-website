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
