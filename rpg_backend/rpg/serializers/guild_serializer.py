from rest_framework import serializers
from rpg.models import Guild


class GuildSerializer(serializers.ModelSerializer):
    class Meta:
        model = Guild
        fields = "__all__"
