from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated
from rpg.models import Quest
from rpg.serializers import QuestSerializer


class QuestViewSet(viewsets.ModelViewSet):
    queryset = Quest.objects.all()
    serializer_class = QuestSerializer
    permission_classes = [IsAuthenticated]
