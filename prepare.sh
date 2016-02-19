#!/bin/sh

ARCHIVE_WEBAPP="https://clarin.fz-juelich.de/owncloud/public.php?service=files&t=c5e63c5d1eea6ffbc274d2a94d853f2d&download"
NAME="vlo-3.4-beta1"

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
