#!/bin/bash
# Docker entrypoint script.

set -e

# Ensure the app's dependencies are installed
mix deps.get

# Wait until Postgres is ready
echo "Testing if Postgres is accepting connections. {$PGHOST} {$PGPORT} ${PGUSER}"
while ! pg_isready -q -h $PGHOST -p $PGPORT -U $PGUSER
do
  echo "$(date) - waiting for database to start"
  sleep 2
done

# Create, migrate, and seed database if it doesn't exist.
if [[ -z `psql -Atqc "\\list $PGDATABASE"` ]]; then
  echo "Database $PGDATABASE does not exist. Creating..."

  echo "Creating routes.."
  mix ecto.create
  mix ecto.migrate
  mix run priv/repo/seeds.exs
  echo "Database $PGDATABASE created."
fi

exec mix phx.server