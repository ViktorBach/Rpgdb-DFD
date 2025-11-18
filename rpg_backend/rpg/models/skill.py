from django.db import models

class Skill(models.Model):
    name = models.CharField(max_length=45)
    description = models.CharField(max_length=255, blank=True, null=True)
    damage = models.IntegerField(blank=True, null=True)
    healing = models.IntegerField(blank=True, null=True)

    def __str__(self):
        return self.name