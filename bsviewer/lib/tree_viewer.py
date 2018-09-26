from bsviewer.models.attribute import Attribute
from bsviewer.models.schema import Schema

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
        'text': u'{} '.format(node_name),
        'parent': u'{}'.format(parent_node),
        'icon': False
    }
    # if 'id' in el.attrib and node_name in elements_with_id_attributes and \
    #         parent_node_name not in ('Project', 'Consumption'):
    #     node['id'] = el.get('id')
    # if 'sameas' in el.attrib:
    #     node['data'] = {'refid': el.attrib['sameas']}
    # elif node_name in ('InstalledComponent', 'ReplacedComponent', 'ProjectSystemIdentifiers', 'UtilityID', 'CustomerID') or \
    #         (node_name == 'BuildingID' and parent_node_name != 'Building'):
    #     node['data'] = {'refid': el.attrib['id']}
    # if len(el) > 0:
    #     # container node
    #     node['children'] = []
    #     for subel in el:
    #         if subel.tag is etree.Comment or subel.tag is etree.PI:
    #             continue
    #         node['children'].append(get_jstree_node(subel))
    # else:
    #     for k, v in el.attrib.items():
    #         node['text'] += u' <span class="label label-info">{}: {}</span>'.format(k, v)
    #     if el.text:
    #         node['text'] += u' <span class="label label-default">{}</span>'.format(el.text)
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
    i = 0
    for el in attributes:
        i += 1
        # if i > 500:
        #     continue


        node = get_jstree_node(el)
        if el.tree_level <= 1:
            node['icon'] = 'glyphicon glyphicon-{}'.format(glyphicon_map.get(el.name, 'asterisk'))
        if el.tree_level == 0:
            node['state'] = {}
            node['state']['opened'] = True


        jstree_data.append(node)

    # for el in root:
    #     if el.tag is etree.Comment or el.tag is etree.PI:
    #         continue
    #     node = get_jstree_node(el)
    #     node['icon'] = 'glyphicon glyphicon-{}'.format(glyphicon_map.get(strip_namespace(el.tag), 'asterisk'))
    #     jstree_data.append(node)

    return jstree_data