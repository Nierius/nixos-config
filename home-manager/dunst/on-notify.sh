#!/bin/sh

LOCKFILE="$HOME/.config/dunst/unseen_notifications.lock"

# Attempt to acquire the lock
while ! mkdir "$LOCKFILE" 2>/dev/null; do
    echo "Another instance is running. Waiting..."
    sleep 0.01  # Wait before trying again
done


UNSEEN_FILE="$HOME/.config/dunst/unseen_notifications"
UNSEEN_COUNT=$(cat "$UNSEEN_FILE")
UNSEEN_COUNT=$((UNSEEN_COUNT + 1))

# Update the unseen notification count
echo "$UNSEEN_COUNT" > "$UNSEEN_FILE"
rmdir "$LOCKFILE"

