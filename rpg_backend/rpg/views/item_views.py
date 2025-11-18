from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated
from rpg.models import Item
from rpg.serializers import ItemSerializer


class ItemViewSet(viewsets.ModelViewSet):
    queryset = Item.objects.all()
    serializer_class = ItemSerializer
    permission_classes = [IsAuthenticated]
