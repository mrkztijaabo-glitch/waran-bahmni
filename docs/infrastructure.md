# Infrastructure Planning

This document outlines the infrastructure planning decisions for the Waran Bahmni HIS deployment.

## Cloud Provider

We have selected **DigitalOcean** as the cloud provider. DigitalOcean offers a simple and cost‑effective platform for deploying containerized workloads, with managed services available for databases and object storage. The platform’s predictable pricing and availability in the African region make it suitable for our deployment.

## Droplet Specification

The initial deployment will use a **4GB RAM, 2 vCPU, 80 GB SSD** Droplet running Ubuntu 22.04 LTS. This size provides enough resources for a single‑node Bahmni installation including OpenMRS (Bahmni EMR), OpenELIS, and Odoo ERP. Disk space is allocated to support database files, log storage, and application binaries.

## Resource Estimation

Based on an estimated patient load of around **500 monthly active patients** in the initial phase, the 4 GB/2 vCPU Droplet should handle typical workloads (patient registration, lab orders, billing). Memory and CPU utilisation will be monitored during the pilot to ensure there is headroom for growth.

## Scaling Plan

As patient volumes increase, the following scaling strategies will be considered:

- **Vertical scaling**: resize the primary Droplet to larger plans (e.g. 8 GB or 16 GB RAM, additional vCPUs) to accommodate more simultaneous users.
- **Database offloading**: migrate MySQL/PostgreSQL databases to DigitalOcean’s managed database services, freeing resources on the application Droplet and improving performance, reliability, and automated backups.
- **Horizontal scaling**: deploy additional droplets for specific services (e.g. separate OpenELIS or Odoo instances) behind a load balancer. Use DigitalOcean Load Balancers to distribute traffic.
- **Storage expansion**: attach additional volumes or use DigitalOcean Spaces for object storage (e.g. scanned documents, images).

## Documentation

These sizing and design decisions should be revisited after the initial deployment. Monitoring metrics (CPU, memory, disk I/O) will guide when to scale resources. Future documentation updates will include cost estimates and any changes to the architecture.
