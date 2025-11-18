import django
import os

# Django project settings
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'rpg_backend.settings')
django.setup()

from django.contrib.auth.models import User
from rpg.models import (
    Guild, Inventory, NPC, Item, Skill,
    Quest, Battle, Transaction, Character
)

print("Seeding database...")

# -------------------------
# USERS
# -------------------------
# Create users only if they don't exist
users = {
    "Thorin": ("oakenshield", "thorin@example.com"),
    "Harry": ("potter", "harry@example.com"),
    "Hermione": ("granger", "hermione@example.com"),
}

for username, (password, email) in users.items():
    if not User.objects.filter(username=username).exists():
        User.objects.create_user(username=username, password=password, email=email)

print("Users created or verified.")

u1 = User.objects.get(username="Thorin")
u2 = User.objects.get(username="Harry")
u3 = User.objects.get(username="Hermione")

# -------------------------
# INVENTORIES
# -------------------------
inv1 = Inventory.objects.create()
inv2 = Inventory.objects.create()
inv3 = Inventory.objects.create()

# -------------------------
# GUILDS
# -------------------------
guilds = [
    ("Knights of Dawn", "10"),
    ("Shadow Blades", "8"),
    ("Mages Circle", "12")
]

g1, g2, g3 = [], [], []

for name, members in guilds:
    guild, created = Guild.objects.get_or_create(
        guild_name=name,
        defaults={"members": members}
    )
    if name == "Knights of Dawn":
        g1 = guild
    elif name == "Shadow Blades":
        g2 = guild
    elif name == "Mages Circle":
        g3 = guild

# -------------------------
# NPCs
# -------------------------
n1 = NPC.objects.create(name="Elder Rowan", role="Quest Giver", location="Oakvale")
n2 = NPC.objects.create(name="Merchant Tilda", role="Vendor", location="Ironforge")
n3 = NPC.objects.create(name="Captain Duran", role="Quest Giver", location="Stormkeep")

# -------------------------
# ITEMS
# -------------------------
i1 = Item.objects.create(name="Iron Sword", type="Weapon", rarity="Common", value="50", stats="+10 ATK")
i2 = Item.objects.create(name="Healing Potion", type="Consumable", rarity="Common", value="10", stats="+50 HP")
i3 = Item.objects.create(name="Mana Crystal", type="Consumable", rarity="Uncommon", value="25", stats="+40 Mana")

# -------------------------
# SKILLS
# -------------------------
s1 = Skill.objects.create(name="Fireball", description="Shoot fire", damage=40, healing=0)
s2 = Skill.objects.create(name="Heal", description="Restore HP", damage=0, healing=50)
s3 = Skill.objects.create(name="Ice Spike", description="Shoot ice", damage=25, healing=0)

# -------------------------
# QUESTS
# -------------------------
q1 = Quest.objects.create(title="Defeat Goblins", reward_money="100", reward_xp=300, description="Clear forest", npc=n1)
q2 = Quest.objects.create(title="Deliver Package", reward_money="50", reward_xp=150, description="Bring supplies", npc=n3)
q3 = Quest.objects.create(title="Lost Tome", reward_money="200", reward_xp=400, description="Find ancient book", npc=n1)

# -------------------------
# BATTLES
# -------------------------
b1 = Battle.objects.create(outcome="Victory", xp=200, money="50")
b2 = Battle.objects.create(outcome="Defeat", xp=50, money="0")
b3 = Battle.objects.create(outcome="Victory", xp=300, money="75")

# -------------------------
# CHARACTERS
# -------------------------
c1 = Character.objects.create(character_name="Aelric", level=10, hp=200, mana=100, user=u1, inventory=inv1, guild=g1)
c2 = Character.objects.create(character_name="Lyra", level=8, hp=150, mana=180, user=u2, inventory=inv2, guild=g3)
c3 = Character.objects.create(character_name="Grimnar", level=12, hp=300, mana=50, user=u3, inventory=inv3, guild=g2)

# -------------------------
# TRANSACTIONS
# -------------------------
Transaction.objects.create(quantity="2", cost=100, user=u1)
Transaction.objects.create(quantity="1", cost=250, user=u2)
Transaction.objects.create(quantity="5", cost=50, user=u3)

print("Database seeded successfully!")
