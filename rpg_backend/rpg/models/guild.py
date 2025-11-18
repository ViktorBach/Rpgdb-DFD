from django.db import models


class Guild(models.Model):
    guild_name = models.CharField(max_length=45, unique=True)
    members = models.CharField(max_length=45, blank=True, null=True)

    def __str__(self):
        return self.guild_name