#!/bin/bash

echo "Stopping any existing Xvfb processes on :1..." >&2
pkill -f "Xvfb :1" 2>/dev/null || true

echo "Removing stale Xvfb lock file if it exists..." >&2
rm -f /tmp/.X1-lock

echo "Starting Xvfb on display :1..." >&2
Xvfb :1 -screen 0 800x600x24 &

export DISPLAY=:1

# Give Xvfb a moment to start
sleep 1

# Check if Xvfb is running
if ! pgrep -f "Xvfb :1" > /dev/null; then
    echo "❌ Failed to start Xvfb on display :1" >&2
    exit 1
fi

echo "✅ Xvfb started on DISPLAY=:1" >&2
echo "Running app: $@" >&2

# Run main command
exec "$@"
