from django.core.management.base import BaseCommand

from bsyncviewer.models.schema import Schema
from bsyncviewer.lib.documentation_generator.generate_docs import generate_docs

class Command(BaseCommand):
    help = 'Generate html docs for schemas'

    def add_arguments(self, parser):
        parser.add_argument(
            '--schema_version',
            type=str,
            help='Generate docs for a specific schema version'
        )
        parser.add_argument(
            '--all',
            action='store_true',
            help='Generate docs for all schemas in database',
        )

    def handle(self, *args, **options):
        schemas = []
        if options['all']:
            schemas = Schema.objects.all()
        else:
            try:
                schemas = [Schema.objects.get(version=options['schema_version'])]
            except Schema.DoesNotExist:
                self.stderr.write(f'No schema with version {options["schema_version"]}')
                exit(1)

        for schema in schemas:
            generate_docs(schema.schema_file.path, schema.version)
            self.stdout.write(f'Generated documentation for {schema.version}')
