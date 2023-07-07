#!/bin/bash

# Optionally load environment variables from a file (example in .postgres.env)
source .postgres.local.env

# Check if required environment variables are set
if [ -z "$PG_HOST" ] || [ -z "$PG_PORT" ] || [ -z "$PG_DATABASE" ] || [ -z "$PG_USER" ] || [ -z "$PG_PASSWORD" ] || [ -z "$PG_FOLDER" ]; then
    echo "Error: Required PostgreSQL environment variables are not set."
    exit 1
fi

# Generate a timestamp for the backup file
timestamp=$(date +%Y%m%d%H%M%S)
backup_file="$PG_FOLDER/db_backup_$timestamp.sql.gz"

# Perform the database dump
pg_dump "host=$PG_HOST port=$PG_PORT dbname=$PG_DATABASE user=$PG_USER password=$PG_PASSWORD" | gzip > "$backup_file"

if [ $? -eq 0 ]; then
    echo "Database dumped successfully to: $backup_file"
else
    echo "Error: Failed to dump the database."
    rm -f "$backup_file"
    exit 1
fi
