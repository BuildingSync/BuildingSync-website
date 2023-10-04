from pathlib import Path

from django.conf import settings
from lxml import etree

XSL_PATH = Path(__file__).parent / 'xs3p.xsl'
DEFAULT_DOCS_PATH = Path(settings.MEDIA_ROOT) / 'generated_docs'


def get_docs_path(schema_version):
    """Returns the expected file path of generated docs for a specific schema version.
    Used to create and cleanup documentation files.

    :param schema_version: str
    :return: str
    """
    return str(DEFAULT_DOCS_PATH / f'{schema_version}.html')


def generate_docs(schema_path, schema_version, output_path=None):
    """Generate html docs for an XSD.

    :param schema_path: str, path to the schema
    :param schema_version: str, e.g. 1.2.3
    :param output_path: str, filename for the html result. If None, defaults to
        the media directory with the version as the file name.
    """

    if output_path is None:
        output_path = get_docs_path(schema_version)
        Path(output_path).parent.mkdir(parents=True, exist_ok=True)

    xsl_tree = etree.parse(str(XSL_PATH))
    xsl_transform = etree.XSLT(xsl_tree)
    schema_tree = etree.parse(schema_path)

    result = xsl_transform(schema_tree)
    with open(output_path, 'w') as f:
        f.write(str(result))
