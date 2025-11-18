from django.db import models
from django.contrib.auth.models import User

class Transaction(models.Model):
    quantity = models.CharField(max_length=45, blank=True, null=True)
    cost = models.IntegerField(blank=True, null=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="transactions")

    def __str__(self):
        return f"Transaction {self.id}"