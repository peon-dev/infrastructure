#!/usr/bin/env bash

set -e

docker compose pull dashboard

LOGS_START=$(expr $(date +%s))

# Do not restart other services (Postgres, Mercure)
# It they were not running, they will start automatically thanks to `depends_on`
docker compose up --detach dashboard worker scheduler

docker compose logs --since $LOGS_START dashboard worker scheduler
