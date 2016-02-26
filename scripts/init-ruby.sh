#!/bin/bash

. /etc/profile.d/rvm.sh

rvm use 2.2.4

ruby -v

export HOME=/im-agine-pts

cd im-agine-pts/
gem install bundler
bundle install
