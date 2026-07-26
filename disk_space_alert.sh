#!/bin/bash
# Set threshold limit to 80 percent
THRESHOLD=80

# Extract the current disk usage percentage for root (/)
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

echo "------------------------------------------"
echo "Checking System Storage Metrics..."
echo "------------------------------------------"

if [ "$DISK_USAGE" -gt "$THRESHOLD" ]; then
    echo "[CRITICAL ALERT] Disk usage has breached safety limits: ${DISK_USAGE}%!"
    echo "Action required: Please clear old logs in /var/log immediately."
else
    echo "[OK] Disk space is healthy at ${DISK_USAGE}%."
fi
echo "------------------------------------------"
