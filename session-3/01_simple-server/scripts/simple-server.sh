#!/bin/sh

set -e

# These will always be set, so we don't need to set defaults
MESSAGE="$(snapctl get message)"
HOST="$(snapctl get host)"
PORT="$(snapctl get port)"

while true; do
  echo "$MESSAGE" | ncat -4 --listen --send-only "$HOST" "$PORT"
done
