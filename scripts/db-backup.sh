#!/bin/bash
# Backup script for Bahmni HIS databases (MySQL and PostgreSQL)

BACKUP_DIR="./backups/$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

# MySQL backup for OpenMRS (Bahmni)
mysqldump -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -h "$MYSQL_HOST" "$MYSQL_DATABASE" > "$BACKUP_DIR/mysql_backup.sql"

# PostgreSQL backup for Odoo
PGPASSWORD="$POSTGRES_PASSWORD" pg_dump -U "$POSTGRES_USER" -h "$POSTGRES_HOST" -d "$POSTGRES_DB" -F c -f "$BACKUP_DIR/postgres_backup.dump"

echo "Backups saved in $BACKUP_DIR"
