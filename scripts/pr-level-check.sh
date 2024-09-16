#!/bin/bash

#build
npm run build

#start
npm run start &

# Wait for the server to start
sleep 10

# Run Sitespeed
# sitespeed.io $URL -b $BROWSER -n $NUM_RUNS
podman run --rm -v "$(pwd):/sitespeed.io" sitespeedio/sitespeed.io:latest http://host.docker.internal:3000
# docker --version