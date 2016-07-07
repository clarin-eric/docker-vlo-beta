#!/bin/sh

NAME="vlo-beta"
IMAGE="docker.clarin.eu/vlo-beta:1.0.4"
HOST_LOGS="/Users/wilelb/var/log/docker/vlo-beta"

mkdir -p ${HOST_LOGS}
#sudo chown -R wilelb:staff ${HOST_LOGS}
mkdir -p /srv/vlo-data
#sudo chown -R wilelb:staff /srv/vlo-data

docker stop $NAME
docker rm $NAME
docker run -d \
    --name $NAME \
    -p 8080:8080 \
    -e "SOLR_DATA=/opt/solr-data" \
    -e "STATSD_PREFIX=vlo.local.test" \
    -v /Users/wilelb/vlo-data:/srv/vlo-data \
    -v ${HOST_LOGS}:/var/log/tomcat8 \
    $IMAGE
