#!/usr/bin/env bash
# Use this script to test if a given TCP host/port are available

set -e

HOST=$1
shift
PORT=$1
shift
CMD="$@"

if [[ -z "$HOST" || -z "$PORT" ]]; then
  echo "Error: host and port must be provided"
  exit 1
fi

>&2 echo "Waiting for $HOST:$PORT to be available"

while ! nc -z $HOST $PORT; do
  sleep 1
done

>&2 echo "$HOST:$PORT is available - executing command"
exec $CMD
