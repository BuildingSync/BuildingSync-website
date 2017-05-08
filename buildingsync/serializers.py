from rest_framework import serializers

from buildingsync.models import UseCase, Schema, BuildingSyncAttribute


class UseCaseSerializer(serializers.ModelSerializer):
    class Meta:
        model = UseCase
        fields = '__all__'


class SchemaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Schema
        fields = '__all__'


class BuildingSyncAttributeSerializer(serializers.ModelSerializer):
    class Meta:
        model = BuildingSyncAttribute
        fields = '__all__'
