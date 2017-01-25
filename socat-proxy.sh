#!/usr/bin/env bash

LISTEN_PORT=${LISTEN_PORT:-80}
DEFAULT_PORT=80

if [ "$#" -ne 1 ]; then
    echo "usage: $(basename $0) host[:port=${DEFAULT_PORT}]"
    exit 1
fi

if [[ $1 =~ (.*):([0-9]+) ]]
then
    HOST="${BASH_REMATCH[1]}"
    PORT="${BASH_REMATCH[2]}"
else
    HOST="$1"
    PORT="${DEFAULT_PORT}"
fi

echo "relay TCP/IP connections on :${LISTEN_PORT} to ${HOST}:${PORT}"
socat TCP-LISTEN:${LISTEN_PORT},fork TCP:${HOST}:${PORT}
