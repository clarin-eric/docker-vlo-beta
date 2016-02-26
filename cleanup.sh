#!/bin/sh

echo "Cleaning up"

if [ -d "webapp/vlo-3.4-beta2" ]; then
	echo "\tRemoving webapp/vlo-3.4-beta2*"
	rm -r webapp/vlo-3.4-beta2*
fi
