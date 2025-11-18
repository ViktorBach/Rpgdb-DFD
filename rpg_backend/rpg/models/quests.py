from django.db import models
from .npc import NPC

class Quest(models.Model):
    title = models.CharField(max_length=45)
    reward_money = models.CharField(max_length=45, blank=True, null=True)
    reward_xp = models.IntegerField(blank=True, null=True)
    description = models.CharField(max_length=255, blank=True, null=True)
    npc = models.ForeignKey(NPC, on_delete=models.CASCADE, related_name="quests")

    def __str__(self):
        return self.title