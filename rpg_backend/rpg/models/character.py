from django.db import models
from django.contrib.auth.models import User
from .battle import Battle
from .guild import Guild
from .inventory import Inventory
from .skill import Skill 
from .quests import Quest


class Character(models.Model):
    character_name = models.CharField(max_length=45, unique=True)
    level = models.IntegerField()
    hp = models.IntegerField()
    mana = models.IntegerField()

    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="characters")
    inventory = models.OneToOneField(Inventory, on_delete=models.CASCADE)
    guild = models.ForeignKey(Guild, on_delete=models.SET_NULL, null=True, blank=True)

    skills = models.ManyToManyField(Skill, blank=True, related_name="characters")
    quests = models.ManyToManyField(Quest, blank=True, related_name="characters")
    battles = models.ManyToManyField(Battle, blank=True, related_name="characters")

    def __str__(self):
        return self.character_name