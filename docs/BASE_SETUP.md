# Base Setup

This document outlines the baseline system setup tasks required before deploying the Bahmni HIS. These steps are meant for documentation purposes only; do not execute commands here.

## Swap and Kernel Parameters
- Configure a swap file (e.g. 2 GB) to ensure the server has sufficient virtual memory.
- Tune kernel parameters for Docker and database performance if needed.

## Firewall and Security
- Enable the system firewall (UFW or equivalent) with a default-deny policy.
- Allow inbound traffic only on SSH (22) and application ports (80/443 for web).
- Install fail2ban to mitigate brute-force attacks.

## User and SSH Management
- Create a non-root user for administering the system.
- Add the user to the sudo group.
- Configure SSH keys for authentication and disable password logins.

## Storage and Directories
- Create persistent directories for MySQL, PostgreSQL, OpenMRS, OpenELIS, and Odoo data (e.g. under `/opt/bahmni_data`).
- Set appropriate ownership and permissions on these directories.
- Plan for regular backups and off-site replication.

## Additional Services
- Install and configure any prerequisite packages (e.g. Docker, Docker Compose) required for running the Bahmni containers.
- Keep the operating system updated with security patches.
