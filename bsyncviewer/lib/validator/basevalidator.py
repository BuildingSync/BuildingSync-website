from lxml import etree


class ValidationError(Exception):

    def __init__(self, msgs=[]):
        if isinstance(msgs, list) or isinstance(msgs, set) or isinstance(msgs, tuple):
            self.messages = list(msgs)
        else:
            self.messages = [msgs]

    def __str__(self):
        return '\n'.join(self.messages)


class BaseValidator(object):

    def __init__(self):
        self.xml_root = None

    def parse_file(self, f):
        """
        Parse the xml from a file or file-like object
        :param f: file or file-like object
        :return: None
        """
        self.xml_root = etree.parse(f).getroot()

    def parse_string(self, xml_str):
        """
        Parse the xml from a string
        :param xml_str: string of xml data
        :return: None
        """
        self.xml_root = etree.fromstring(xml_str)

    def assert_valid(self):
        """
        stub method: replace in subclass with method that throws a ValidationError if the file isn't valid.
        :return: None
        """

    def validate(self):
        """
        Return True if document is valid, False if not
        :return: boolean
        """
        try:
            self.assert_valid()
        except ValidationError:
            return False
        else:
            return True
