#!/bin/bash
set -e

# List of databases to create
DATABASES=("user_db" "transaction_db" "notification_db" "wallet_db" "ewallet")

# Create each database if it doesn't exist
for DB in "${DATABASES[@]}"; do
    echo "Creating database: $DB"
    psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
        SELECT 'CREATE DATABASE $DB' 
        WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = '$DB')\gexec
        GRANT ALL PRIVILEGES ON DATABASE "$DB" TO "$POSTGRES_USER";
EOSQL
done
