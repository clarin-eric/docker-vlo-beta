#!/bin/sh

source version

echo "Cleaning up"
if [ -d "webapp/${NAME}" ]; then
	echo "\tRemoving webapp/${NAME}*"
	rm -r webapp/${NAME}*
fi
