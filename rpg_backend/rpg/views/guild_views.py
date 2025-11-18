from rest_framework import viewsets
from rpg.permissions import IsAdminOrReadOnly
from rpg.models import Guild
from rpg.serializers import GuildSerializer


class GuildViewSet(viewsets.ModelViewSet):
    queryset = Guild.objects.all()
    serializer_class = GuildSerializer
    permission_classes = [IsAdminOrReadOnly]
