#!/bin/sh

echo "Cleaning up"

if [ -d "webapp/vlo-3.4-beta1" ]; then
	echo "\tRemoving webapp/vlo-3.4-beta1*"
	rm -r webapp/vlo-3.4-beta1*
fi
