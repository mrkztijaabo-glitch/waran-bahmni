# Security Guidelines

This document records the basic security practices for the Waran Bahmni HIS deployment.

## Operating System Hardening

- **Create a non‑root user** with sudo privileges for day‑to‑day operations.
- **Configure UFW firewall** to allow only required ports (e.g., SSH, HTTP/HTTPS, Bahmni).
- **Disable password authentication** on SSH when key‑based authentication is available.
- **Install fail2ban** to mitigate brute force attacks.

## Network Security

- Expose only necessary service ports externally; keep database ports internal to the Docker network.
- Use an Nginx reverse proxy (with SSL termination) to handle all incoming traffic.
- Enforce HTTPS via Let’s Encrypt certificates.

## Secrets Management

- Store sensitive environment variables (passwords, API keys) in an `.env` file that is not committed to version control.
- Use Docker secrets or a secrets manager for production deployments.

## Updates & Patching

- Regularly apply security updates to the host operating system and containers.
- Monitor CVEs for Bahmni modules and dependencies.

## Future Enhancements

- Implement intrusion detection and monitoring tools.
- Consider using managed database services with built‑in backups and encryption at rest.
