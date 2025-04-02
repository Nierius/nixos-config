#!/bin/sh

LOCKFILE="$HOME/.config/dunst/unseen_notifications.lock"

# Attempt to acquire the lock
while ! mkdir "$LOCKFILE" 2>/dev/null; do
    echo "Another instance is running. Waiting..."
    sleep 0.01  # Wait before trying again
done

UNSEEN_FILE="$HOME/.config/dunst/unseen_notifications"
UNSEEN_COUNT=$(cat "$UNSEEN_FILE")

if [ "$UNSEEN_COUNT" -gt 0 ]; then
  count=0
  
  while [ "$count" -lt "$UNSEEN_COUNT" ]; do
    dunstctl history-pop
    ((count++))
  done

  echo 0 > "$UNSEEN_FILE"
else
    dunstify -u low "No missed notifications."
    echo 0 > "$UNSEEN_FILE"
fi
rmdir "$LOCKFILE"

