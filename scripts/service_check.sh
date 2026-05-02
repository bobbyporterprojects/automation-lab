#!/bin/bash

# service_check.sh
# Checks whether a Linux service is active.

SERVICE_NAME="$1"

if [ -z "$SERVICE_NAME" ]; then
    echo "Usage: ./service_check.sh <service_name>"
    echo "Example: ./service_check.sh ssh"
    exit 1
fi

if systemctl is-active --quiet "$SERVICE_NAME"; then
    echo "OK: $SERVICE_NAME is running."
    exit 0
else
    echo "WARNING: $SERVICE_NAME is not running."
    exit 2
fi
