#!/bin/bash

python="/app/venv/bin/python"

$python /app/manage.py makemigrations --noinput
$python /app/manage.py migrate --noinput --run-syncdb
$python /app/manage.py collectstatic --no-input
/app/venv/bin/gunicorn projectazo.wsgi:application --workers $GUNICORN_WORKERS --bind 0.0.0.0:8000