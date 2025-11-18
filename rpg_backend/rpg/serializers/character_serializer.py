from rest_framework import serializers
from django.contrib.auth.models import User
from rpg.models import Character


class CharacterSerializer(serializers.ModelSerializer):
    user = serializers.PrimaryKeyRelatedField(read_only=True)

    class Meta:
        model = Character
        fields = "__all__"
