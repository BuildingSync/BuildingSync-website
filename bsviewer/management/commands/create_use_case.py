from django.core.management.base import BaseCommand

from bsviewer.models.attribute import Attribute
from bsviewer.models.enumeration import Enumeration
from bsviewer.models.schema import Schema
from bsviewer.models.use_case import UseCase
from bsviewer.models.use_case_attribute import (
    UseCaseAttribute,
    UseCaseEnumeration,
    STATE_REQUIRED,
    STATE_IGNORED,
)


class Command(BaseCommand):
    help = 'Closes the specified poll for voting'

    def add_arguments(self, parser):
        # parser.add_argument('--filename', type=str)
        # parser.add_argument('--filename', type=str)
        pass

    def handle(self, *args, **options):

        # grab a schema
        schema = Schema.objects.filter(version='0.3').first()
        if not schema:
            self.stdout.write('Schema not found, import schema first')

        # Delete and create use case
        use_case = UseCase.objects.filter(name='test use case', schema=schema).first()
        if use_case:
            use_case.delete()

        use_case = UseCase(name='test use case', schema=schema)
        use_case.save()

        # grab random attributes
        attributes = Attribute.objects.filter(schema=schema).order_by('?')[:10]
        for attrib in attributes:
            UseCaseAttribute.objects.get_or_create(
                use_case=use_case, attribute=attrib, state=STATE_REQUIRED
            )

        # grab some random enumerations
        enums = Enumeration.objects.filter(schema=schema).order_by('?')[:10]
        for enum in enums:
            UseCaseEnumeration.objects.get_or_create(
                use_case=use_case, enumeration=enum, state=STATE_IGNORED
            )

        for attrib in use_case.attributes.all():
            print(attrib)

        for enums in use_case.enumerations.all():
            print(enums)
        self.stdout.write('Finished parsing and saving 0.3 schema')
