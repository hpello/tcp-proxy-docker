#!/usr/bin/env bash

if [[ $1 =~ (.*):([0-9]+) ]]; then
    HOST="${BASH_REMATCH[1]}"
    PORT="${BASH_REMATCH[2]}"
else
    echo "usage: $(basename $0) host:port"
    exit 1
fi

LISTEN_PORT=${LISTEN_PORT:-${PORT}}

echo "relay TCP/IP connections on :${LISTEN_PORT} to ${HOST}:${PORT}"
socat TCP-LISTEN:${LISTEN_PORT},fork TCP:${HOST}:${PORT}
