from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated
from rpg.models import Battle
from rpg.serializers import BattleSerializer


class BattleViewSet(viewsets.ModelViewSet):
    queryset = Battle.objects.all()
    serializer_class = BattleSerializer
    permission_classes = [IsAuthenticated]
