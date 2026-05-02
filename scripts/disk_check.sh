#!/bin/bash

# disk_check.sh
# Checks disk usage for a given path and warns if usage exceeds a threshold.

CHECK_PATH="$1"
THRESHOLD="$2"

if [ -z "$CHECK_PATH" ] || [ -z "$THRESHOLD" ]; then
    echo "Usage: ./disk_check.sh <path> <threshold_percentage>"
    echo "Example: ./disk_check.sh / 80"
    exit 1
fi

if [ ! -d "$CHECK_PATH" ]; then
    echo "Error: Path does not exist or is not a directory: $CHECK_PATH"
    exit 1
fi

USAGE=$(df "$CHECK_PATH" | awk 'NR==2 {print $5}' | sed 's/%//')

echo "Disk usage for $CHECK_PATH: $USAGE%"

if [ "$USAGE" -ge "$THRESHOLD" ]; then
    echo "WARNING: Disk usage is above threshold of $THRESHOLD%."
    exit 2
else
    echo "OK: Disk usage is below threshold of $THRESHOLD%."
    exit 0
fi
