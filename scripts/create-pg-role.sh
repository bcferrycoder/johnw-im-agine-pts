#!/bin/sh

/usr/bin/psql --command "CREATE ROLE \"im-agine-pts\" WITH CREATEDB LOGIN PASSWORD 'test'"
