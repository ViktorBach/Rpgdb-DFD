from django.db import models

class Battle(models.Model):
    outcome = models.CharField(max_length=45, blank=True, null=True)
    xp = models.IntegerField(blank=True, null=True)
    money = models.CharField(max_length=45, blank=True, null=True)

    def __str__(self):
        return f"Battle {self.id} - {self.outcome}"