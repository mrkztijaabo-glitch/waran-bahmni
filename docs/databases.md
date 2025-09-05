# Database Management

This document describes the database setup and maintenance for the Bahmni HIS deployment.

## Databases

- **MySQL** 5.7 for OpenMRS (Bahmni EMR). The service is defined in `docker-compose.yml` and uses environment variables `MYSQL_ROOT_PASSWORD`, `MYSQL_USER`, `MYSQL_PASSWORD`, `MYSQL_DATABASE`, and `MYSQL_HOST` defined in `.env`. Data is stored in the `mysql_data` volume.
- **PostgreSQL** 13 for Odoo ERP. It uses environment variables `POSTGRES_DB`, `POSTGRES_USER`, `POSTGRES_PASSWORD`, and `POSTGRES_HOST`. Data is stored in the `postgres_data` volume.

## Persistence and Volumes

Docker volumes ensure database data persists across container restarts. The compose file defines volumes `mysql_data` and `postgres_data` mounted into the container data directories.

## Backup and Restore

Use the `scripts/db-backup.sh` script to create timestamped backups of both databases. The script reads credentials from environment variables and writes backups to a `backups/` directory. To restore:

```bash
# Restore MySQL
mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -h $MYSQL_HOST $MYSQL_DATABASE < backups/<timestamp>/mysql_backup.sql

# Restore PostgreSQL
PGPASSWORD=$POSTGRES_PASSWORD pg_restore -U $POSTGRES_USER -h $POSTGRES_HOST -d $POSTGRES_DB backups/<timestamp>/postgres_backup.dump
```

Always test backups before applying in production.

## Security

- Use strong passwords for database users and do not commit them to the repository.
- Expose database ports only to services that need them (use Docker internal networking).
- Avoid running queries as the root user; create service-specific users with limited privileges.

## Maintenance

- Regularly apply security updates to database images by updating their tags in `docker-compose.yml`.
- Monitor logs and health checks defined in the compose file.
- Plan for storage growth and consider migrating to managed database services if scaling beyond a single VM.
