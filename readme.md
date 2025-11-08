
# Logivance – Backend

This repository contains the **backend service** for the school project **Logivance**, a logistics platform for climate-controlled and traceable delivery of specialized goods. The backend handles data management, authentication, sensor communication, vehicle integration, and provides REST APIs for both the frontend and IoT systems.

> **Note:** The Azure backend, database, frontend, and monitoring have been decommissioned. The backend can now only be run **locally** using Docker and PostgreSQL.


---
## Repository Structure (Top-Level)

```

├── alembic.ini
├── app/                     # FastAPI application
├── Dockerfile
├── docs/                    # Documentation and guides
├── requirements.txt
├── tests/                   # Unit and integration tests
├── VERSION                  # Project version file
└── readme.md

````

> For a detailed file structure, see `app/` and `tests/` folders.

---

## Tech Stack

- **Language:** Python 3.11+
- **Framework:** FastAPI + Uvicorn
- **Database:** PostgreSQL (Azure SQL in production, local via docker compose)
- **ORM & Migrations:** SQLAlchemy + Alembic
- **Authentication:** JWT (PyJWT), Passlib + Bcrypt
- **Rate Limiting:** SlowAPI
- **Testing:** Pytest + pytest-asyncio + pytest-cov
- **Linting & Formatting:** Flake8 + Black
- **Containerization:** Docker
- **Hosting:** Azure Web App via App Service
- **CI/CD:** GitHub Actions
- **Monitoring & Observability:** Azure Monitor + Application Insights
- **Documentation:** Docstrings + Doxygen

---

## Docker Images

We maintain **latest dev and main images** on Docker Hub:

- Repository: [chasadvancegroup4/chas_advance_backend](https://hub.docker.com/repository/docker/chasadvancegroup4/chas_advance_backend/general)

Develop images always have same major tag as main, with updates on minor. To get precised version, check version file in github to download correct image.  
Develop images also gets pushed with latest tag, so if you want the latest image published go with latest tag.
```bash 
# Pull latest dev image
docker pull chasadvancegroup4/chas_advance_backend:latest  
docker pull chasadvancegroup/chas_advance_backend:2.5  2.10 ...   
````

Main images always have tag major.0, to use the latest, check version file in github and use major number.0.  
```bash
# Pull latest main image  
docker pull chasadvancegroup4/chas_advance_backend:2.0   3.0 ...  
````

---

## Running Locally

To run the backend together with a local PostgreSQL instance, follow:

[`docs/running_server_database_locally.md`](docs/running_server_database_locally.md)

This guide explains how to bring up both backend + database via `docker compose`,
including:
- Running the server
- Importing test data
- Exporting DB changes back to `db_dump.sql`

---

## Documentation Overview

Detailed documentation is stored in the [`docs/`](docs/) folder:

| Doc File | Description |
| -------- | ----------- |
| [`install.md`](docs/install.md) | Installation instructions for local development |
| [`running_server_database_locally.md`](docs/running_server_database_locally.md) | **Primary:** Run backend + local PostgreSQL via `docker compose` (recommended) |
| [`running_backend_locally.md`](docs/running_backend_locally.md) | Run only the backend Docker container (pull image from Docker Hub) |
| [`azure_server_guide.md`](docs/azure_server_guide.md) | *Archived:* Azure App Service deployment — **server is no longer live** |
| [`CI_tests.md`](docs/CI_tests.md) | CI workflow for running backend tests |
| [`CI_docker_build.md`](docs/CI_docker_build.md) | CI workflow for building and pushing Docker images |
| [`CI_version_bump.md`](docs/CI_version_bump.md) | CI workflow for automatic version bumping |
| [`CI_CD_pipeline.md`](docs/CI_CD_pipeline.md) | Overview of full CI/CD pipeline from test to deployment |

> Open these files for step-by-step instructions, commands, and best practices.



---

## API Documentation

* **Swagger UI:** [http://localhost:8000/docs](http://localhost:8000/docs)
* **ReDoc:** [http://localhost:8000/redoc](http://localhost:8000/redoc)

---

## Related Repositories

- [Frontend (School Organization)](https://github.com/Chas-Advance-Grupp-4/frontend)  
  React application consuming backend APIs for logistics workflow management.

- [IoT Integration (Embedded)](https://github.com/Chas-Advance-Grupp-4/embedded)  
  Embedded firmware for sensor units providing temperature & environmental telemetry to backend.

- [Project Planning](https://github.com/Chas-Advance-Grupp-4/planning)  
  Central planning repo containing documentation, requirements, diagrams and project management material.


---

## Contributors

**Backend Team – Logivance**

* [Fredrik Rappich](https://github.com/Rappich) – Backend Developer
* [Anna Schwartz](https://github.com/AnnaSchwartzChas) – Backend Developer

---

## Future Improvements

* Expand logging and metrics for better observability.
* Optimize database queries and connection pooling.
* Improve CI/CD with automated rollback for failed deployments.
* Introduce stricter rate limiting and advanced authentication flows.
* Introduce environment-specific configs for staging and production.
* Refactor control unit architecture to support multiple sensor units dynamically instead of hardcoded connections.
* Extend data model and backend APIs to handle GPS data and other future sensor types.
* Refactor backend towards a more modular microservice architecture for improved scalability and maintainability.
* Refactor backend so all endpoints are secured behind login authorization and delete unused endpoints
