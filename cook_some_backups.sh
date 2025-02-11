#!/bin/bash

# Vars
BACKUP_DIR=""
MYSQL_USER=""
MYSQL_PASSWORD=""
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_PATH="$BACKUP_DIR/$TIMESTAMP"
DATABASE_NAME=""

# Creating dir for backup
mkdir -p "$BACKUP_PATH"

# Dumping bases
mysqldump -u $MYSQL_USER -p"$MYSQL_PASSWORD" "$DATABASE_NAME" > "$BACKUP_PATH/$DATABASE_NAME.sql"

# Archivation
tar -czf "$BACKUP_PATH.tar.gz" -C "$BACKUP_DIR" "$TIMESTAMP"

# Deleting temp directory with SQL-file
rm -rf "$BACKUP_PATH"
