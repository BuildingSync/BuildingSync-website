#!/usr/bin/env python

from buildingsync.management.commands.parsing import get_node
from django.core.management.base import BaseCommand

# Step 1: Install Schema Processor:
#   $ pip install generateds

# Step 2: create the Python representation of the schema:
#   $ generateds -o structure.py --use-getter-setter=none BuildingSync_2_0.xsd

# Step 3: import the appropriate database models
from buildingsync.models import Schema, BuildingSyncAttribute

# Step 4: import that structure.py file's class map and set some parameters
from buildingsync.schemas.schema2.structure import GDSClassesMapping as schema_map
SCHEMA_NAME = "BuildingSync, Version 2.0.0"
SCHEMA_VERSION = 2


# Steps 5+ exist within the handle method in the command class instance
class Command(BaseCommand):
    help = 'Sets up a new schema'

    def handle(self, *args, **options):
        # Step 5: create a schema to work with
        s = Schema(name=SCHEMA_NAME, version=SCHEMA_VERSION)
        s.save()

        # Step 6: call the parsing function to create a list of attributes based on a root node string
        schema_entries = get_node(classname='Site', classmap=schema_map)

        # Step 7: create database entries for each schema entry
        for se in schema_entries:
            b = BuildingSyncAttribute(name=se['name'], tree_level=se['$$treeLevel'], schema=s)
            b.save()
