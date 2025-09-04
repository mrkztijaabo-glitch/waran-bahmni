# Infrastructure Planning

This document provides a cloud-neutral infrastructure plan for deploying the Waran Bahmni HIS. It covers recommended sizing, scaling considerations, and compliance notes.

## Sizing Recommendations
- **Compute**: Start with a virtual machine (droplet) with 4 GB RAM, 2 vCPUs, and 80 GB SSD storage. This supports the Bahmni core services (OpenMRS, OpenELIS, Odoo, and databases) for a small hospital.
- **Networking**: Expose only necessary ports (80/443 for web, 3306 for MySQL, 5432 for PostgreSQL if needed). Use a reverse proxy (e.g. Nginx) to terminate TLS.
- **Storage**: Allocate persistent storage volumes for MySQL, PostgreSQL, and application data. Plan for off-machine backups.

## Scaling Strategy
- **Vertical scaling**: Upgrade CPU/RAM as patient load grows. Monitor CPU, memory, and disk IO.
- **Horizontal scaling**: For high availability, plan to separate databases onto managed services (e.g. managed MySQL/PostgreSQL) and deploy application containers across multiple hosts.
- **Load balancing**: Introduce a load balancer or reverse proxy to distribute traffic across multiple application instances.

## Compliance
- Ensure compliance with data protection regulations in your region (e.g. GDPR). Use encrypted connections (HTTPS).
- Perform regular security updates and vulnerability scanning.
- Implement access controls and audit logging.

## Provider Flexibility
This plan is cloud-neutral: you can deploy on DigitalOcean, AWS, Azure, or on-premises. Adjust sizes and services according to your provider’s offerings and anticipated workload.
