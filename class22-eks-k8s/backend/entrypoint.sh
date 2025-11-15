#!/bin/bash
sleep 10 &
./migrate.sh &
exec gunicorn --bind 0.0.0.0:8000 run:app
