#!/usr/bin/env python

from django.core.management.base import BaseCommand
from buildingsync.workers import reset_schema


# Steps 5+ exist within the handle method in the command class instance
class Command(BaseCommand):
    help = 'Sets up a new schema'

    def __init__(self):
        super(BaseCommand, self).__init__()
        self.current_index = 0

    def handle(self, *args, **options):
        reset_schema()
