### Running the Backend locally (Both server and Database)

**File:** `docs/running_server_database_locally.md`

# Running the Backend locally via Docker (Linux / WSL, Windows, Mac)

This guide explains how to run the backend on your local machine via Docker for development and testing.

---

## Prerequisites

* Docker installed on your machine.

  * **Linux / WSL:** Docker Engine installed.
  * **Windows / Mac:** Docker Desktop installed and running.
* Files can be found at [The backend repo](https://github.com/Rappich/Logivance-server) branch `running-localy`.
* `docker-compose.yml` downloaded and placed in the same folder as `.env`.
* `db_dump.sql` downloaded and placed in the same folder as `.env`.
* `.env` file in project root with required environment variables:

```text
DATABASE_URL=<your-database-url>
SECRET_KEY=<your-secret-key>
ALGORITHM=HS256
ACCESS_TOKEN_EXPIRE_MINUTES=30
CONTROL_UNIT_SECRET_KEY=<your-secret-key-for-control-unit>
ENV=development
FRONTEND_URL=<frontend-url>
```

> **Warning:** Do not commit `.env` to GitHub. Keep it local or use secrets.

---

## Running the Containers (Linux / WSL)

1. Start containers in **detached mode** so they stay in the background:

```bash
docker compose up -d --build
```

2. Load the initial database schema and demo data **after the database is ready**:

```bash
docker compose exec -T database psql -U user -d logistics_db < db_dump.sql
```

3. Check the logs of containers (backend, database) to ensure everything is running:

```bash
docker compose logs -f
```

4. Stop containers when done:

```bash
docker compose down
```

---

## Running on Windows / Mac (with Docker Desktop)

* Open **Docker Desktop** and ensure it’s running.
* Open **PowerShell** (or Git Bash).
* Use the same commands as Linux / WSL:

```powershell
docker compose up -d --build
docker compose exec -T database psql -U user -d logistics_db < db_dump.sql
docker compose logs -f
docker compose down
```

> ⚠️ **Note:** Use Git Bash for `docker compose exec` if PowerShell gives issues with input redirection (`< db_dump.sql`).

---

## Access the API

* URL: [http://localhost:8000](http://localhost:8000)
* Swagger UI: [http://localhost:8000/docs](http://localhost:8000/docs)
* Health check: [http://localhost:8000/health](http://localhost:8000/health)

Expected response:

```json
{"status": "ok", "message": "API is running"}
```

---

## Demo Credentials

For demonstration purposes, the database comes with the following users:

| Role     | Username  | Password  |
| -------- | --------- | --------- |
| Admin    | admin     | admin     |
| Customer | customer1 | customer1 |

> These credentials are demo-only. Do not use them in production.

You can log in via the API endpoints or through the frontend (if connected to this backend) using these credentials.

---

## Notes

* Multi-arch images work on AMD64 and ARM64.
* Containers are **not in reload mode**; restart after code changes.
* Local containers are **not exposed to the internet**.
* Use the health endpoint to ensure the startup is correct.

---

This version is:

* **Safe:** Database loads before backend tries to query it.
* **Cross-platform:** Gives Linux/WSL and Windows/Mac instructions.
* **Debug-friendly:** Includes `docker compose logs -f` for troubleshooting.
