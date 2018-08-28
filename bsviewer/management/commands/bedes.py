from django.core.management.base import BaseCommand

from bsviewer.lib.bedes.bedes_parser import BedesParser


class Command(BaseCommand):
    help = 'Closes the specified poll for voting'

    def add_arguments(self, parser):
        # parser.add_argument('nothing', nargs='+', type=int)
        pass

    def handle(self, *args, **options):
        bedes = BedesParser('v1.2')
        bedes.save()

        print(bedes.terms)
        print(bedes.categories)

        self.stdout.write('Finished parsing bedes')
