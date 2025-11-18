# RPG Backend API

A Django REST Framework backend for an RPG-style game featuring users, characters, guilds, items, skills, quests, battles, and transactions.

This project includes:
- JWT & Token authentication
- CRUD operations for all RPG models
- Relational database using Django ORM
- Swagger UI documentation
- Automated database seeding
- Role-based access control (admin vs. regular users)

---

## How you will get started

### 1. Create a virtual environment
```bash
python -m venv venv
source venv/bin/activate   # macOS
venv\Scripts\activate      # Windows
```

### 2. Install dependencies
```bash
pip install -r requirements.txt
```

### 3. Apply migrations
```bash
python manage.py migrate
```

### 4. Seed the database 
Op to you if you want to do this step.

Creates sample users, characters, items, guilds, etc.
```bash
python seed_data.py
```

A reset script is included:
```bash
bash reset_db.sh
```

---

## Authentication

### Token Authentication

Get a token:
```bash
POST /api/auth/login
```

Use it:
```makefile
Authorization: Token <your_token>
```

### JWT Authentication

Get JWT access + refresh tokens:
```swift
POST /api/auth/jwt/login
```

Refresh access token:
```swift
POST /api/auth/jwt/refresh
```

---

### API Documentation (Swagger UI)

Swagger is provided via drf-spectacular.

Open in browser:

* http://localhost:8000/api/docs/

* http://localhost:8000/api/schema/

### Here is an overview
#### Available Endpoints
Resource	URL Prefix	Notes
Users	/api/users/	Admin-only
Characters	/api/characters/	Users manage their own
Guilds	/api/guilds/	Public read, admin edit
Items	/api/items/	Admin-only
Inventory	/api/inventory/	System-managed
NPCs	/api/npcs/	Admin-only
Skills	/api/skills/	Admin-only
Quests	/api/quests/	Admin-only
Battles	/api/battles/	Admin-only
Transactions	/api/transactions/	Linked to users

---

## Users Included 

The users is included via seeding

Admin user

* username: sofiethorlund

* (password set manually)

Regular users

* Viktor

* Luna

* Thorin

* Harry

---

## Our Tech Stack

* Python
* Django
* Django REST Framework
* JWT Authentication (SimpleJWT)
* DRF Token Authentication
* Swagger Documentation (drf-spectacular)
* SQLite database

---

## Super Users info for developers can remember is for now haha (remind me to delete later)
Login:
Username: sofiethorlund 
Email address: sof@gmail.com
Password: superPass123

or use:
Username: viktorbach
Email address: viktor@gmail.com
Password: superPass123



