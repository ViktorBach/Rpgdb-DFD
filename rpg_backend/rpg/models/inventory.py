from django.db import models


class Inventory(models.Model):
    # Inventory contains many items (M2M defined later in Item model)
    def __str__(self):
        return f"Inventory {self.id}"

