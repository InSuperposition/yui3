#!/bin/bash

echo "Before Script: `pwd`"

cd "$(dirname "$0")"

echo "cd: `pwd`"

cd ../../yui;
wait

if [ -n "$TRAVIS" ]; then
    echo "Installing Shifter.."
    npm -g install shifter -loglevel silent
    cd ../
    echo "building entire library";
    shifter --walk --no-lint --no-coverage
    cd yui;
fi

make npm
