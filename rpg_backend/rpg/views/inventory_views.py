from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated
from rpg.models import Inventory
from rpg.serializers import InventorySerializer


class InventoryViewSet(viewsets.ModelViewSet):
    queryset = Inventory.objects.all()
    serializer_class = InventorySerializer
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        if self.request.user.is_staff:
            return Inventory.objects.all()
        return Inventory.objects.filter(character_user=self.request.user)
    
