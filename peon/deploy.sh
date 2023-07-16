#!/usr/bin/env bash

set -e

# Peon app
docker pull ghcr.io/peon-dev/peon:main

# Recipes
docker pull ghcr.io/peon-dev/php-recipes:main

LOGS_START=$(expr $(date +%s))

# Do not restart other services (Postgres, Mercure)
# It they were not running, they will start automatically thanks to `depends_on`
docker compose up --detach --force-recreate dashboard worker scheduler
docker compose logs --since $LOGS_START dashboard worker scheduler
