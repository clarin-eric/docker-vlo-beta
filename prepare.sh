#!/bin/sh

ARCHIVE_WEBAPP="https://clarin.fz-juelich.de/owncloud/public.php?service=files&t=c74d48d9a15aa1a7dfc456718edb9b83&download"
NAME="vlo-3.4-beta2"

echo "Downloading external resources"

echo "\tComponent Registry release" && \
cd webapp && \
curl -s -S -J -O "$ARCHIVE_WEBAPP" && \
tar -xf *.tar.gz && \
cd $NAME/war && \
sh unpack-wars.sh > /dev/null && \
cd ../.. && \
cp VloConfig.xml $NAME/config && \
cd ..
