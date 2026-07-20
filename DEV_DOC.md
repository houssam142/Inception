# Developer Documentation

## Environment Setup

### Prerequisites

- Docker
- Docker Compose
- Make

## Project Structure

- docker-compose.yml: defines all services and their configuration
- Makefile: automates build and run commands
- requirements/: contains Dockerfiles and configurations for each service

## Configuration

Configuration is managed through:

- `.env` file: environment variables (non-sensitive data)
- `secrets/` directory: sensitive data (passwords, credentials)
- Initialization scripts: database setup and service configuration

Sensitive data should never be hardcoded in source files.

## Build and Launch

Using Makefile:

make

This command builds all Docker images and starts the containers using Docker Compose.

## Docker Compose Commands

You can also run commands manually:

To build and start services:

docker compose up --build

To stop services:

docker compose down

To view running containers:

docker compose ps

## Data Persistence

Docker volumes are used to store persistent data.

Data is mapped to:

/home/hounejja/data/

This ensures that:

- Database data is preserved
- WordPress files are retained

Even if containers are removed or restarted, the data remains available.
