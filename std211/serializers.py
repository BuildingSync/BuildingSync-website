from rest_framework import serializers

from std211.models import Standard211Instance


class Std211InstanceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Standard211Instance
        fields = '__all__'
