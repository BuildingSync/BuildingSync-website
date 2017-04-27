#!/usr/bin/env python

from django.core.management.base import BaseCommand
from buildingsync.models import Schema, BuildingSyncAttribute


class Command(BaseCommand):
    help = 'Clears schemas and attributes'

    def handle(self, *args, **options):
        Schema.objects.all().delete()
        BuildingSyncAttribute.objects.all().delete()
