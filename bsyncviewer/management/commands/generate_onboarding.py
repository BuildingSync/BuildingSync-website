import os
import subprocess

from django.core.management.base import BaseCommand


class Command(BaseCommand):
    help = 'Generate onboarding html and pdf'

    def handle(self, *args, **options):
        subprocess.check_output('pandoc --wrap=none ../../docs/onboarding.md -o onboarding_content.html',
                                cwd='bsyncviewer/templates').decode()
        subprocess.check_output('pandoc ../../docs/onboarding.md -o documents/BuildingSync-on-boarding.pdf',
                                cwd='bsyncviewer/static').decode()
