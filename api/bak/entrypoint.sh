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
  echo "User tables creating.."
  # User
  mix phx.gen.json Accounts User users email:string username:string password_hash:string
  echo "Working tables creating.."
  # Working
  mix phx.gen.json Accounts WorkingTime working_times start_time:utc_datetime end_time:utc_datetime user_id:references:users
  echo "Clocking tables creating.."
  # Clocking
  mix phx.gen.json Accounts Clocking clockings clock_in:utc_datetime clock_out:utc_datetime user_id:references:users  
  mix ecto.migrate
  mix run priv/repo/seeds.exs
  echo "Database $PGDATABASE created."
fi

exec mix phx.server