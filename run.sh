#!/bin/bash
set -e
: "${API_KEY:?API_KEY must be set}"  # fail closed: never serve the API without a key

# PolicyEngine listens on 8081; set explicitly so a PORT injected by the platform can't move it onto 8080.
PORT=8081 /app/start.sh &
caddy run --config /app/Caddyfile --adapter caddyfile &

wait -n  # if either process dies, exit so the platform restarts the container
exit 1
