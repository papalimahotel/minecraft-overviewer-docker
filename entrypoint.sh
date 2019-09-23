#!/bin/bash

# Start the nginx service
service nginx start

# Set the envionment variables to defaults if not present
if [ -z $OVERVIEWER_CYCLE ]; then
	export OVERVIEWER_CYCLE=3600
fi

if [ -z $OVERVIEWER_TEXTURE_URL ]; then
	# v1.14.4 client jar
	export OVERVIEWER_TEXTURE_URL="https://launcher.mojang.com/v1/objects/8c325a0c5bd674dd747d6ebaa4c791fd363ad8a9/client.jar"
fi

if [ -z $OVERVIEWER_WORLD_NAME ]; then
	export OVERVIEWER_WORLD_NAME="myworld"
fi

wget $OVERVIEWER_TEXTURE_URL -P /texture

# Repeatedly render the maps at the specified interval
while true; do
	/usr/src/app/overviewer/overviewer.py --config="/config.py" --genpoi
	/usr/src/app/overviewer/overviewer.py --config="/config.py"
	sleep $OVERVIEWER_CYCLE
done
