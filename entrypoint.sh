#!/bin/bash

# Clean up old Xvfb lock files if they exist
if [ -e /tmp/.X99-lock ]; then
  echo "Removing stale Xvfb lock file..."
  rm -f /tmp/.X99-lock
fi

# Set up environment
export DISPLAY=:99
XAUTHORITY=/home/xclient/.Xauthority
export XAUTHORITY

# Create .Xauthority file
mkdir -p $(dirname $XAUTHORITY)
touch $XAUTHORITY
xauth add $DISPLAY . $(mcookie)

# Start Xvfb in background
Xvfb $DISPLAY -screen 0 1024x768x16 &

# Small delay to let Xvfb start
sleep 2

# Run the app
exec "$@"
