#!/bin/bash

: ${PORT:=3000}
export PORT

. /etc/profile.d/rvm.sh

rvm use 2.2.4

/scripts/docker-entrypoint.sh postgres &

sleep 5
/scripts/bashtp.sh
