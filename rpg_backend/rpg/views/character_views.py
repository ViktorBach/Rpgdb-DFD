from rest_framework import viewsets
from rpg.permissions import IsOwnerOrAdmin
from rpg.models import Character
from rpg.serializers import CharacterSerializer


class CharacterViewSet(viewsets.ModelViewSet):
    queryset = Character.objects.all()
    serializer_class = CharacterSerializer
    permission_classes = [IsOwnerOrAdmin]

    def get_queryset(self):
        if self.request.user.is_staff:
            return Character.objects.all()
        return Character.objects.filter(user=self.request.user)
