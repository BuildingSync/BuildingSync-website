from rest_framework import serializers
from buildingsync.models import UseCase


class UseCaseSerializer(serializers.ModelSerializer):
    class Meta:
        model = UseCase
        fields = ('id', 'nickname', 'show')
