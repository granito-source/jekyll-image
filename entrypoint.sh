#!/bin/sh

if [ -r Gemfile ]; then
    bundle install
fi

exec "$@"
