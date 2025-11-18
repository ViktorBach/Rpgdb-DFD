from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated
from rpg.models import Transaction
from rpg.serializers import TransactionSerializer


class TransactionViewSet(viewsets.ModelViewSet):
    queryset = Transaction.objects.all()
    serializer_class = TransactionSerializer
    permission_classes = [IsAuthenticated]
