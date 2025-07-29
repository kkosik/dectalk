#!/bin/bash

echo "Stopping any existing Xvfb processes on :99..."
pkill -f "Xvfb :99"

echo "Removing stale Xvfb lock file if it exists..."
rm -f /tmp/.X99-lock

echo "Starting Xvfb on display :99..."
Xvfb :99 -screen 0 1024x768x16 &
export DISPLAY=:99

# Optional: sleep briefly to ensure Xvfb has started
sleep 1

# Run your main command
echo "Running app: $@"
exec "$@"
