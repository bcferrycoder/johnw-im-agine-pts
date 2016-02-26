#!/bin/bash

/usr/bin/psql --command "CREATE ROLE \"im-agine-pts\" WITH CREATEDB LOGIN PASSWORD 'test'"

: ${PORT:=3000}
export PORT

. /etc/profile.d/rvm.sh

rvm use 2.2.4

/scripts/docker-entrypoint.sh postgres &

sleep 5
cd /im-agine-pts
export HOME=/im-agine-pts
echo "starting rails on port $PORT"
bundle exec rails s -p $PORT -b '0.0.0.0'
