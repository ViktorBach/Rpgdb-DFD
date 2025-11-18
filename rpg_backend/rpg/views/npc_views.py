from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated
from rpg.models import NPC
from rpg.serializers import NPCSerializer


class NPCViewSet(viewsets.ModelViewSet):
    queryset = NPC.objects.all()
    serializer_class = NPCSerializer
    permission_classes = [IsAuthenticated]
