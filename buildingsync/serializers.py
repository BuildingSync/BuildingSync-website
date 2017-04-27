from rest_framework import serializers
from buildingsync.models import UseCase, Schema, BuildingSyncAttribute


class UseCaseSerializer(serializers.ModelSerializer):
    class Meta:
        model = UseCase
        fields = ('id', 'nickname', 'show')


class SchemaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Schema
        fields = ('name',)


class BuildingSyncAttributeSerializer(serializers.ModelSerializer):
    class Meta:
        model = BuildingSyncAttribute
        fields = ('name', 'schema', 'tree_level', 'use_cases')
