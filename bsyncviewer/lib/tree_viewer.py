from bsyncviewer.models.attribute import Attribute
from bsyncviewer.models.schema import Schema

glyphicon_map = {
    'Audit': 'edit',
    'Sites': 'home',
    'Systems': 'dashboard',
    'Schedules': 'time',
    'Measures': 'flash',
    'Report': 'list-alt',
    'Contacts': 'phone-alt',
    'Tenants': 'user',
    'UserDefinedFields': 'cog',
}


def strip_namespace(x):
    return x.replace('auc:', '')


def get_jstree_node(el):
    node_name = el.name
    parent_node = el.parent
    if parent_node is None:
        parent_node = '#'

    node = {
        'id': u'{}'.format(el.pk),
        'text': u'{}'.format(node_name),
        'parent': u'{}'.format(parent_node),
        'icon': False
    }

    return node


def get_schema_jstree_data(version):

    # get attributes with this schema version
    schema = Schema.objects.get(version=version)
    print("SCHEMA RETRIEVED: {}".format(schema))

    attributes = Attribute.objects.filter(schema=schema)
    # if it takes too long, reduce # of tree levels to display
    # attributes = Attribute.objects.filter(schema=schema, tree_level__lte=8)
    print("{} attributes retrieved".format(attributes.count()))

    jstree_data = []

    for el in attributes:
        node = get_jstree_node(el)
        if el.tree_level <= 1:
            node['icon'] = 'glyphicon glyphicon-{}'.format(glyphicon_map.get(el.name, 'asterisk'))
        if el.tree_level == 0:
            node['state'] = {}
            node['state']['opened'] = True

        jstree_data.append(node)

    return jstree_data
