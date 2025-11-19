from django.contrib import admin
from .models import (
    Guild, Inventory, Item, NPC, Skill, Quest,
    Character, Battle, Transaction
)
# registering the models to appear in the admin interface
admin.site.register(Guild)
admin.site.register(Inventory)
admin.site.register(Item)
admin.site.register(NPC)
admin.site.register(Skill)
admin.site.register(Quest)
admin.site.register(Character)
admin.site.register(Battle)
admin.site.register(Transaction)
