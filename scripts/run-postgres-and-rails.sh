#!/bin/bash

: ${PORT:=3000}
export PORT

. /etc/profile.d/rvm.sh

rvm use 2.2.4

/scripts/docker-entrypoint.sh postgres &

sleep 15
echo "creating pg role"
su - postgres -c /scripts/create-pg-role.sh
cd /im-agine-pts
echo "creating db"
rake db:create
echo "migrating db"
rake db:migrate

echo "starting rails on port $PORT"
export HOME=/im-agine-pts
bundle exec rails s -p $PORT -b '0.0.0.0'
