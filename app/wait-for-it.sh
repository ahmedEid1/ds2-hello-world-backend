#!/usr/bin/env bash
# Use this script to test if a given TCP host/port are available

set -e

if [ -z "$1" ]; then
  echo "Host not specified"
  exit 1
fi

host="$1"
shift

if [ -z "$1" ]; then
  echo "Port not specified"
  exit 1
fi

port="$1"
shift

cmd="$@"

until nc -z "$host" "$port"; do
  >&2 echo "$host:$port is unavailable - sleeping"
  sleep 1
done

>&2 echo "$host:$port is up - executing command"
exec $cmd
