from rest_framework import serializers
from rpg.models import Quest


class QuestSerializer(serializers.ModelSerializer):
    class Meta:
        model = Quest
        fields = "__all__"
