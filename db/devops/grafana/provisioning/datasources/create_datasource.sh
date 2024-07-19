#!/bin/bash

until psql -h postgres -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c '\q'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

until curl -s http://prometheus:9090/metrics; do
  >&2 echo "Prometheus is unavailable - sleeping"
  sleep 1
done

until curl -s http://postgres_exporter:9187/metrics; do
  >&2 echo "Postgres Exporter is unavailable - sleeping"
  sleep 1
done

echo "Postgres, Prometheus, and Postgres Exporter are up - executing command"
envsubst < /etc/grafana/provisioning/datasources/datasource.yml > /var/lib/grafana/provisioning/datasources/datasource.yml
