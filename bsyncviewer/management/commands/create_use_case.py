import os
from django.core.management.base import BaseCommand

from bsyncviewer.models.schema import Schema
from bsyncviewer.models.use_case import UseCase
from django.core.files.uploadedfile import SimpleUploadedFile
from django.conf import settings
DEFAULT_SCHEMA_VERSION = settings.DEFAULT_SCHEMA_VERSION


class Command(BaseCommand):
    help = 'Create a use case'

    def add_arguments(self, parser):
        # parser.add_argument('--filename', type=str)
        # parser.add_argument('--filename', type=str)
        pass

    def handle(self, *args, **options):

        # grab a schema
        schema = Schema.objects.filter(version=DEFAULT_SCHEMA_VERSION).first()
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

        self.stdout.write('Finished parsing and saving {} schema'.format(DEFAULT_SCHEMA_VERSION))
