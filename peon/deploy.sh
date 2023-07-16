#!/usr/bin/env bash

set -e

docker compose pull dashboard

# Do not restart other services (Postgres, Mercure)
# It they were not running, they will start automatically thanks to `depends_on`
docker-compose up dashboard worker scheduler -d
