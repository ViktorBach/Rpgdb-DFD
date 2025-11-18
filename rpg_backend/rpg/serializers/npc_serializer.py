from rest_framework import serializers
from rpg.models import NPC


class NPCSerializer(serializers.ModelSerializer):
    class Meta:
        model = NPC
        fields = "__all__"
