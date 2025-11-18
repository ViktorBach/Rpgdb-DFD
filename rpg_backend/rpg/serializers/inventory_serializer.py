from rest_framework import serializers
from rpg.models import Inventory

class InventorySerializer(serializers.ModelSerializer):
    items = serializers.PrimaryKeyRelatedField(
        many=True,
        read_only=True
    )

    class Meta:
        model = Inventory
        fields = ["id", "items"]