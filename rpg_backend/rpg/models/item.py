from django.db import models
from .inventory import Inventory

class Item(models.Model):
    name = models.CharField(max_length=45)
    type = models.CharField(max_length=45, blank=True, null=True)
    rarity = models.CharField(max_length=45)
    value = models.CharField(max_length=45, blank=True, null=True)
    stats = models.CharField(max_length=45, blank=True, null=True)

    inventories = models.ManyToManyField(Inventory, related_name="items", blank=True)

    def __str__(self):
        return self.name