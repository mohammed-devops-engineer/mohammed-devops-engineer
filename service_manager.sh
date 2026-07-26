#!/bin/bash
# Define the critical service to track (e.g., sshd)
SERVICE="sshd"

echo "Checking the operational status of service: $SERVICE"

# Check if the service is active using systemctl
if systemctl is-active --quiet "$SERVICE"; then
    echo "[OK] $SERVICE is running smoothly."
else
    echo "[WARNING] $SERVICE is DOWN! Attempting emergency restart..."
    sudo systemctl start "$SERVICE"
    
    # Re-verify status after restart attempt
    if systemctl is-active --quiet "$SERVICE"; then
        echo "[RESOLVED] $SERVICE was successfully restarted and is operational."
    else
        echo "[ERROR] Automated restart failed. Manual intervention required."
    fi
fi
