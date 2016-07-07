#!/bin/sh

docker \
    run \
    -ti \
    --rm \
    -v /Users/wilelb/vlo-data:/srv/vlo-data/ \
    -e "STATSD_PREFIX=vlo.local.test" \
    docker.clarin.eu/vlo-beta:1.0.4 \
    /opt/importer.sh
