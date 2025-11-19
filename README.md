# RPG Backend – Django + MySQL + DRF + JWT

This project is an RPG backend API built using **Django**, **Django REST Framework**, **MySQL**, and **JWT authentication**.  
It supports CRUD operations for users, characters, guilds, items, quests, battles, skills, and more.

It also includes:

✔ MySQL as the production-ready database  
✔ Clean ViewSets + Serializers  
✔ Token + JWT Authentication  
✔ Automatic API documentation via Swagger UI  
✔ Seed script to populate demo data  
✔ Admin interface  
✔ Postman collection for easy testing  
✔ Clear project structure and code organization  

---

## 1. Requirements

Before running the project, ensure you have the following installed:

- Python **3.12+**
- MySQL Server (Workbench is fine)
- Pip + venv
- Git

---

## 2. Project Structure

rpg_backend/
│── rpg/ # App with models, views, serializers, permissions
│── rpg_backend/ # Main Django project
│── seed_data.py # Seeds initial demo data
│── requirements.txt # Python dependencies
│── README.md

---

## How you will get started

## Setup Instructions

### Clone the repository

```bash
git clone <repo-url>
cd rpg_backend
```
Create and activate a virtual environment

```bash
python3 -m venv venv
source venv/bin/activate     # macOS/Linux
```
Install all dependencies
```bash
pip install -r requirements.txt
```

## MySQL Setup

### Log into MySQL
```bash
mysql -u root -p
```
```sql
4.2 Create the database
CREATE DATABASE rpg_db;
```

## Configure Django to use MySQL

In rpg_backend/settings.py, ensure the database configuration looks like:
```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'rpg_db',
        'USER': 'root',
        'PASSWORD': 'yourpassword',
        'HOST': 'localhost',
        'PORT': '3306',
    }
}
```
Replace "yourpassword" with your actual MySQL root password.

## Run Migrations

Apply database migrations:
```bash
python manage.py migrate
```

This creates all required tables in MySQL.

### Seed the Database (Demo Data)

Run the included seed script:
```bash
python seed_data.py
```
You should see output confirming users, guilds, inventories, items, etc. were created.

## Create Superuser (if you want)
```bash
python manage.py createsuperuser
```

Then log in here:

- http://localhost:8000/admin/

## Start the Development Server
```bash
python manage.py runserver
```

---

## API Documentation (Swagger UI)

Open the automatic API documentation at:

- http://localhost:8000/api/docs/

This includes:

All endpoints

Models and schemas

Example requests

Authorize with JWT

Test endpoints directly

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

## Postman Collection

Import the included:

- postman_collection.json

It contains ready-to-test requests for all API endpoints.

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



