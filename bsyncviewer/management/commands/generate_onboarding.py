import subprocess

from django.core.management.base import BaseCommand


class Command(BaseCommand):
    help = 'Generate onboarding html and pdf'

    def handle(self, *args, **options):
        subprocess.check_output('pandoc --wrap=none docs/onboarding.md -o bsyncviewer/templates/onboarding_content.html').decode()
        subprocess.check_output('pandoc docs/onboarding.md -o bsyncviewer/static/documents/BuildingSync-on-boarding.pdf').decode()
