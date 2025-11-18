#!/bin/bash

echo "🚨 RESETTING DJANGO DATABASE 🚨"
echo "This will delete db.sqlite3, migrations, and recreate everything."

# Delete SQLite database
if [ -f "db.sqlite3" ]; then
    echo "Removing db.sqlite3..."
    rm db.sqlite3
else
    echo "⚠️ db.sqlite3 does not exist, skipping."
fi

# Remove all migration files except __init__.py
echo "Clearing migration files..."
find rpg/migrations -type f ! -name "__init__.py" -delete

# Run migrations
echo "Creating migrations..."
python manage.py makemigrations

echo "Applying migrations..."
python manage.py migrate

# Create superuser automatically
echo "Creating superuser (sofiethorlund / superPass123)..."

python manage.py shell << EOF
from django.contrib.auth.models import User
if not User.objects.filter(username="sofiethorlund").exists():
    User.objects.create_superuser("sofiethorlund", "sofiethorlund@example.com", "superPass123")
    print("Superuser created.")
else:
    print("Superuser already exists.")
EOF

# Step 5: Seed database
echo "🌱 Seeding database with seed_data.py..."
python seed_data.py

echo "✅ DONE! Database fully reset, migrated, and seeded!"
echo "Login to admin: username=sofiethorlund | password=superPass123"
