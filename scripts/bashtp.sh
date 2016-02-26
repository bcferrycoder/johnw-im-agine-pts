#!/bin/bash

: ${PORT:=3000}
export PORT

echo "starting nc listener on port $PORT"
while true; do    echo -e "HTTP/1.1 200 OK\n\n $(date)" | nc -l -p $PORT -q 1; done
