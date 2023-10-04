import os

from django.conf import settings
from django.core.files.uploadedfile import SimpleUploadedFile
from django.core.management.base import BaseCommand

from bsyncviewer.models.schema import Schema
from bsyncviewer.models.use_case import UseCase

DEFAULT_SCHEMA_VERSION = settings.DEFAULT_SCHEMA_VERSION


class Command(BaseCommand):
    help = 'Create a use case. Note that this is a hard code use case for testing.'

    def add_arguments(self, parser):
        parser.add_argument('--schema_version', type=str, default=settings.DEFAULT_SCHEMA_VERSION)
        # parser.add_argument('--filename', type=str)

    def handle(self, *args, **options):
        schema_version = options['schema_version']

        # grab a schema
        schema = Schema.objects.filter(version=schema_version).first()
        if not schema:
            self.stdout.write('Schema not found, import schema first')

        # Delete and create use case
        use_case = UseCase.objects.filter(name='test use case', schema=schema).first()
        if use_case:
            use_case.delete()

        use_case = UseCase(name='test use case', schema=schema)
        usf = os.path.join(os.path.dirname(__file__), '..', '..', 'tests', 'data', 'test_use_case.sch')
        file = open(usf, 'rb')
        simple_uploaded_file = SimpleUploadedFile(file.name, file.read())
        use_case.import_file = simple_uploaded_file
        use_case.save()

        self.stdout.write('Finished parsing and saving {} schema'.format(schema_version))
