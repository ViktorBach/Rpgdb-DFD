from django.db import models

class NPC(models.Model):
    name = models.CharField(max_length=45)
    role = models.CharField(max_length=45, blank=True, null=True)
    location = models.CharField(max_length=45, blank=True, null=True)

    def __str__(self):
        return self.name