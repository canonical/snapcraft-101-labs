#!/bin/sh

main() {
  set -eu

  SERVER_PORT="$(snapctl get daemon.port)"; SERVER_PORT="${SERVER_PORT:-4321}"
  SERVER_HOST="$(snapctl get daemon.host)"; SERVER_HOST="${SERVER_HOST:-127.0.0.1}"
  SERVER_MSG="$(snapctl get daemon.msg)"; SERVER_MSG="${SERVER_MSG:-Hello, world!}"

  while :; do
    echo "ncat started on '${SERVER_HOST}:${SERVER_PORT}', with message '${SERVER_MSG}'"
    echo "${SERVER_MSG}" | ncat -4 --listen --send-only "${SERVER_HOST}" "${SERVER_PORT}"
  done
}

main "$@"
