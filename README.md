## 🧩 Installation Guide

Follow these steps to set up and run the RPG database in a fully functional test environment using Docker.

### 1️⃣ Prerequisites
Make sure you have the following installed on your system:
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/)
- (Optional) [MySQL Workbench](https://dev.mysql.com/downloads/workbench/) or [JetBrains DataGrip](https://www.jetbrains.com/datagrip/)

> 💡 If you get an error like `zsh: command not found: docker-compose`, use the modern command:
> ```bash
> docker compose up -d
> ```

---

### 2️⃣ Clone the Repository
```bash
git clone https://github.com/<your-username>/rpgdb_test.git
cd rpgdb_test

Run
docker compose up -d
