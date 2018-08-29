from django.core.management.base import BaseCommand

from bsviewer.lib.bedes.bedes_parser import BedesParser
from bsviewer.models.schema import Schema


class Command(BaseCommand):
    help = 'Closes the specified poll for voting'

    def add_arguments(self, parser):
        # parser.add_argument('nothing', nargs='+', type=int)
        pass

    def handle(self, *args, **options):
        bedes = BedesParser('v1.2')
        bedes.save()

        # print(bedes.terms)
        # print(bedes.categories)

        # read the fields from the database, right now default to shema 0.3
        schema = Schema.objects.filter(version='0.3').first()

        for attribute in schema.attributes.all().order_by('index'):
            print(attribute)
            for enum in attribute.enumerations.all():
                print(' ******************* %s' % enum)

        self.stdout.write('Finished parsing bedes')
