#!/usr/bin/env bash

if [ "$#" -ne 2 ]; then
    echo "usage: $(basename $0) host port"
    exit 1
fi

HOST="$1"
PORT="$2"
LISTEN_PORT=${LISTEN_PORT:-${PORT}}
pid=0

term_handler() {
  if [ $pid -ne 0 ]; then
    kill -SIGTERM "$pid"
    wait "$pid"
  fi
  exit 143; # 128 + 15 -- SIGTERM
}

int_handler() {
  if [ $pid -ne 0 ]; then
    kill -SIGINT "$pid"
    wait "$pid"
  fi
  exit 130; # 128 + 2 -- SIGINT
}

trap 'kill ${!}; term_handler' SIGTERM
trap 'kill ${!}; int_handler' SIGINT
echo "relay TCP/IP connections on :${LISTEN_PORT} to ${HOST}:${PORT}"

socat TCP-LISTEN:${LISTEN_PORT},fork,reuseaddr TCP:${HOST}:${PORT} &
pid="$!"

# wait forever
while true
do
  tail -f /dev/null & wait ${!}
done
