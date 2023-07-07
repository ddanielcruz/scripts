#!/bin/bash

# Optionally load environment variables from a file (example in .mysql.env)
# source .mysql.local.env

# Check if required environment variables are set
if [ -z "$MYSQL_HOST" ] || [ -z "$MYSQL_PORT" ] || [ -z "$MYSQL_DATABASE" ] || [ -z "$MYSQL_USER" ] || [ -z "$MYSQL_PASSWORD" ] || [ -z "$MYSQL_FOLDER" ]; then
    echo "Error: Required MySQL environment variables are not set."
    exit 1
fi

# Generate a timestamp for the backup file
timestamp=$(date +%Y%m%d%H%M%S)
backup_file="$MYSQL_FOLDER/db_backup_$timestamp.sql.gz"

# Perform the database dump
mysqldump -h "$MYSQL_HOST" -P "$MYSQL_PORT" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" | gzip > "$backup_file"

if [ $? -eq 0 ]; then
    echo "Database dumped successfully to: $backup_file"
else
    echo "Error: Failed to dump the database."
    rm -f "$backup_file"
    exit 1
fi
