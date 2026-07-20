# User Documentation

## Overview

This project provides a containerized web infrastructure composed of:

- NGINX: reverse proxy handling HTTPS requests
- WordPress: web application (CMS)
- MariaDB: database used by WordPress

---

## Starting the Project

To start all services:

make

---

## Stopping the Project

To stop all services:

make down

## Accessing the Services

- Website: https://hounejja.42.fr  
- WordPress Admin Panel: https://hounejja.42.fr/wp-admin/

## Credentials

Credentials are defined in:

- `.env` file (general configuration)
- `secrets/` directory (sensitive data such as passwords)

These include:

- Database credentials
- WordPress admin account
- FTP credentials

## Basic Checks

To verify that services are running:

docker compose ps

To check logs of a specific container:

docker logs <container_name>

To ensure the website is working:

- Open https://<your_login>.42.fr in a browser
- Verify that the WordPress site is accessible
