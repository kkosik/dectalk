#!/bin/bash

echo "Stopping any existing Xvfb processes on :99..." >&2
pkill -f "Xvfb :99" 2>/dev/null || true

echo "Removing stale Xvfb lock file if it exists..." >&2
rm -f /tmp/.X99-lock

echo "Starting Xvfb on display :99..." >&2
Xvfb :99 -screen 0 1024x768x16 &

export DISPLAY=:99

# Give Xvfb a moment to start
sleep 1

# Check if Xvfb is running
if ! pgrep -f "Xvfb :99" > /dev/null; then
    echo "❌ Failed to start Xvfb on display :99" >&2
    exit 1
fi

echo "✅ Xvfb started on DISPLAY=:99" >&2
echo "Running app: $@" >&2

# Run main command
exec "$@"
