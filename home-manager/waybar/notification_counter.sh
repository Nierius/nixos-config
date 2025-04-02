#!/bin/sh

UNSEEN_FILE="$HOME/.config/dunst/unseen_notifications"

if [ ! -f "$UNSEEN_FILE" ]; then
    echo 0 > "$UNSEEN_FILE"
fi

UNSEEN_COUNT=$(cat "$UNSEEN_FILE")

if [ "$UNSEEN_COUNT" -gt 0 ]; then
    echo "$UNSEEN_COUNT"
else
    echo ""
fi

