# Architecture

This document outlines the high-level architecture for the Waran Bahmni HIS deployment.

## Components

- **Bahmni EMR (OpenMRS)** – provides patient records and clinical workflows.
- **OpenELIS** – laboratory information system for lab orders and results.
- **Odoo ERP** – handles billing, pharmacy inventory and other enterprise functions.
- **MySQL** – database for OpenMRS and OpenELIS.
- **PostgreSQL** – database for Odoo.
- **Nginx reverse proxy** (future) – route external traffic to services and terminate HTTPS.

These services run as Docker containers orchestrated via Docker Compose. Each service exposes internal ports on a private Docker network and only necessary ports are published to the host.

## Networking

All containers are connected to a dedicated Docker network (`bahmni_net`) to allow inter‑service communication. External traffic from users enters via a reverse proxy (to be added) on ports 80/443 and is routed internally.

## Persistence

Databases and application data require persistent storage. Docker volumes (e.g. `mysql_data`, `postgres_data`) are used to store data outside container lifecycles. Log directories are also mounted to host paths for easier monitoring.

## Deployment Target

The initial deployment target is a DigitalOcean droplet with 4 GB RAM, 2 vCPUs and 80 GB SSD. Additional droplets or managed database services can be added later for scaling.
