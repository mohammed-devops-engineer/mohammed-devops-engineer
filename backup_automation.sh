#!/bin/bash
# Define source logs and destination directories
SOURCE_DIR="/var/log"
BACKUP_DIR="/opt/system_backups"
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)

echo "Initiating system log archival protocol..."

# Create the backup directory if it does not exist
mkdir -p "$BACKUP_DIR"

# Compress and archive the target log folder
tar -czf "$BACKUP_DIR/log_archive_$TIMESTAMP.tar.gz" "$SOURCE_DIR" 2>/dev/null

if [ $? -eq 0 ]; then
    echo "[SUCCESS] Compressed logs successfully saved to: $BACKUP_DIR/log_archive_$TIMESTAMP.tar.gz"
else
    echo "[FAILURE] Log backup operation encountered an unexpected error."
fi

