#!/bin/sh

source version

echo "Downloading external resources"

echo "\tVirtual Language Observatory release" && \
cd webapp && \
curl -s -S -J -O "${DOWNLOAD_LINK}" && \
tar -xf *.tar.gz && \
cd ${NAME}/war && \
sh unpack-wars.sh > /dev/null && \
cd ../.. && \
cp VloConfig.xml ${NAME}/config && \
cd ..
