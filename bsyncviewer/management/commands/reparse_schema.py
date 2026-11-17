import os
from collections import defaultdict

from django.core.management.base import BaseCommand, CommandError
from django.db import transaction

from bsyncviewer.models.attribute import Attribute
from bsyncviewer.models.attribute_enumeration_class import AttributeEnumerationClass
from bsyncviewer.models.bedes_models import BedesEnumerationMapping, BedesMapping
from bsyncviewer.models.enumeration import Enumeration
from bsyncviewer.models.enumeration_class import EnumerationClass
from bsyncviewer.models.schema import Schema

# how many unrestorable mappings to list per version before summarizing
MAX_LISTED = 25


class Command(BaseCommand):
    help = (
        "Rebuild the parsed attribute tree and enumerations of existing schema versions in place. "
        "Unlike reset_schema, the Schema row is kept, so its use cases and uploaded file are preserved. "
        "BEDES term and enumeration mappings are carried over to the new rows by attribute path and "
        "by (attribute path, enumeration name), falling back to the enumeration class name."
    )

    def add_arguments(self, parser):
        group = parser.add_mutually_exclusive_group(required=True)
        group.add_argument(
            "--schema_version",
            action="append",
            dest="schema_versions",
            metavar="VERSION",
            help="Schema version to re-parse. Repeat to re-parse several versions.",
        )
        group.add_argument(
            "--all", action="store_true", help="Re-parse every schema version."
        )
        parser.add_argument(
            "--dry-run",
            action="store_true",
            help="Re-parse and report what would change, then roll back all database changes.",
        )

    def handle(self, *args, **options):
        if options["all"]:
            schemas = list(Schema.objects.order_by("id"))
        else:
            schemas = []
            for version in options["schema_versions"]:
                schema = Schema.objects.filter(version=version).first()
                if not schema:
                    raise CommandError("Schema version %s does not exist" % version)
                schemas.append(schema)

        for schema in schemas:
            if not schema.schema_file or not os.path.isfile(schema.schema_file.path):
                raise CommandError(
                    "Schema version %s has no schema file on disk; nothing was changed"
                    % schema.version
                )

        for schema in schemas:
            self._reparse(schema, options["dry_run"])

        if options["dry_run"]:
            self.stdout.write(
                self.style.WARNING("Dry run: all database changes were rolled back.")
            )

    def _reparse(self, schema, dry_run):
        self.stdout.write("Re-parsing schema %s" % schema.version)

        with transaction.atomic():
            # 1. Snapshot BEDES mappings by stable keys (DB ids change on re-parse)
            old_attribute_count = Attribute.objects.filter(schema=schema).count()
            old_enumeration_count = Enumeration.objects.filter(schema=schema).count()

            term_mappings = defaultdict(set)  # path -> {(bedes_term_id, match_type)}
            for path, term_id, match_type in BedesMapping.objects.filter(
                attribute__schema=schema
            ).values_list("attribute__path", "bedesTerm_id", "match_type"):
                term_mappings[path].add((term_id, match_type))

            # Enumeration class names are not stable: a class is renamed "Parent::Leaf" once
            # its leaf name appears under more than one parent. So key enumerations by the
            # attribute paths that use them, and fall back to the class name.
            old_class_paths = self._class_paths(schema)
            enum_mappings = {}  # old enum id -> {paths, class_name, name, bedes_ids}
            for (
                enum_id,
                class_id,
                class_name,
                enum_name,
                bedes_enum_id,
            ) in BedesEnumerationMapping.objects.filter(
                enumeration__schema=schema
            ).values_list(
                "enumeration_id",
                "enumeration__enumeration_class_id",
                "enumeration__enumeration_class__name",
                "enumeration__name",
                "bedesEnumeration_id",
            ):
                record = enum_mappings.setdefault(
                    enum_id,
                    {
                        "paths": old_class_paths.get(class_id, set()),
                        "class_name": class_name,
                        "name": enum_name,
                        "bedes_ids": set(),
                    },
                )
                record["bedes_ids"].add(bedes_enum_id)

            # 2. Delete the parsed rows only. This cascades to the BEDES mappings and the
            #    attribute/enumeration-class links, but not to the Schema or its use cases.
            Attribute.objects.filter(schema=schema).delete()
            Enumeration.objects.filter(schema=schema).delete()
            EnumerationClass.objects.filter(schema=schema).delete()

            # 3. Re-parse: the Schema post_save signal parses the file when schema_parsed is False
            schema.schema_parsed = False
            schema.save()
            schema.refresh_from_db()
            if not schema.schema_parsed:
                raise CommandError(
                    "Schema %s was not re-parsed; rolled back" % schema.version
                )

            # 4. Restore BEDES term mappings by attribute path
            new_attribute_ids = defaultdict(list)
            for attribute_id, path in Attribute.objects.filter(
                schema=schema
            ).values_list("id", "path"):
                new_attribute_ids[path].append(attribute_id)

            new_term_mappings = []
            lost_paths = []
            for path, mappings in term_mappings.items():
                if path not in new_attribute_ids:
                    lost_paths.append(path)
                    continue
                for attribute_id in new_attribute_ids[path]:
                    for term_id, match_type in mappings:
                        new_term_mappings.append(
                            BedesMapping(
                                attribute_id=attribute_id,
                                bedesTerm_id=term_id,
                                match_type=match_type,
                            )
                        )
            BedesMapping.objects.bulk_create(new_term_mappings)

            # 5. Restore BEDES enumeration mappings by (attribute path, enumeration name),
            #    falling back to (enumeration class name, enumeration name)
            new_class_paths = self._class_paths(schema)
            new_by_path = defaultdict(set)  # (path, enum name) -> {new enum id}
            new_by_class = {}  # (class name, enum name) -> new enum id
            new_enum_count = 0
            for enum_id, class_id, class_name, enum_name in Enumeration.objects.filter(
                schema=schema
            ).values_list(
                "id", "enumeration_class_id", "enumeration_class__name", "name"
            ):
                new_enum_count += 1
                new_by_class[(class_name, enum_name)] = enum_id
                for path in new_class_paths.get(class_id, ()):
                    new_by_path[(path, enum_name)].add(enum_id)

            new_enum_pairs = set()  # {(new enum id, bedes enum id)}
            lost_enums = []
            for record in enum_mappings.values():
                targets = set()
                for path in record["paths"]:
                    targets |= new_by_path.get((path, record["name"]), set())
                if (
                    not targets
                    and (record["class_name"], record["name"]) in new_by_class
                ):
                    targets.add(new_by_class[(record["class_name"], record["name"])])
                if not targets:
                    lost_enums.append((record["class_name"], record["name"]))
                    continue
                for target in targets:
                    for bedes_enum_id in record["bedes_ids"]:
                        new_enum_pairs.add((target, bedes_enum_id))
            new_enum_mappings = [
                BedesEnumerationMapping(enumeration_id=e, bedesEnumeration_id=b)
                for e, b in sorted(new_enum_pairs)
            ]
            BedesEnumerationMapping.objects.bulk_create(new_enum_mappings)

            # 6. Report
            new_paths = set(new_attribute_ids)
            self.stdout.write(
                "  attributes: %s -> %s, enumerations: %s -> %s"
                % (
                    old_attribute_count,
                    sum(len(ids) for ids in new_attribute_ids.values()),
                    old_enumeration_count,
                    new_enum_count,
                )
            )
            self.stdout.write(
                "  BEDES term mappings restored: %s (on %s of %s mapped paths)"
                % (
                    len(new_term_mappings),
                    len(term_mappings) - len(lost_paths),
                    len(term_mappings),
                )
            )
            self.stdout.write(
                "  BEDES enumeration mappings restored: %s (on %s of %s mapped enumerations)"
                % (
                    len(new_enum_mappings),
                    len(enum_mappings) - len(lost_enums),
                    len(enum_mappings),
                )
            )
            self.stdout.write(
                "  attributes without a BEDES term mapping: %s"
                % len(new_paths - set(term_mappings))
            )
            self._write_lost(
                "BEDES term mappings not restored (path no longer exists)", lost_paths
            )
            self._write_lost(
                "BEDES enumeration mappings not restored (enumeration no longer exists)",
                ["%s: %s" % key for key in lost_enums],
            )

            if dry_run:
                transaction.set_rollback(True)

    @staticmethod
    def _class_paths(schema):
        """Return {enumeration class id: {attribute paths that use the class}}."""
        class_paths = defaultdict(set)
        for class_id, path in AttributeEnumerationClass.objects.filter(
            attribute__schema=schema
        ).values_list("enumeration_class_id", "attribute__path"):
            class_paths[class_id].add(path)
        return class_paths

    def _write_lost(self, label, items):
        if not items:
            return
        self.stdout.write(self.style.WARNING("  %s: %s" % (label, len(items))))
        for item in sorted(items)[:MAX_LISTED]:
            self.stdout.write("    %s" % item)
        if len(items) > MAX_LISTED:
            self.stdout.write("    ... and %s more" % (len(items) - MAX_LISTED))
