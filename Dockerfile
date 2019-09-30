FROM ubuntu:18.04

MAINTAINER papalimahotel

# Set version variables
ARG ver=1.14.4
ARG url=https://launcher.mojang.com/v1/objects/8c325a0c5bd674dd747d6ebaa4c791fd363ad8a9/client.jar

ENV DEBIAN_FRONTEND=noninteractive
# Update apt repository and install required packages
RUN \
	apt-get update && \
	apt-get install -yq git wget python3 python3-pip python3-pil nginx tzdata

# Add python packages
RUN \
	pip3 install numpy && \
	pip3 install Pillow

# Grab Minecraft-Overviwer source from github and compile
RUN mkdir -p /usr/src/app/overviewer
WORKDIR /usr/src/app/overviewer
RUN git clone https://github.com/overviewer/Minecraft-Overviewer.git .
RUN python3 ./setup.py build

# Create folders
RUN \
	mkdir -p /ov/config && \
	mkdir -p /ov/texture && \
	mkdir -p /mc/world && \
	mv /var/www/html /ov && \
	ln -s /ov/html /var/www/html && \
	groupadd --gid 1000 mcov && \
	useradd -m -d /home/mcov --uid 1000 --gid 1000 mcov && \
	mkdir -p /home/mcov/.minecraft/versions/$ver && \
	chown -R mcov.mcov /ov/html && \
	sed -i 's/www-data/mcov/g' /etc/nginx/nginx.conf

# Add custom files
ADD config.py /ov/config/
ADD start /

# Set the start script to be executable and download the default textures
RUN \
	chmod +x /start && \
	wget $url -O /home/mcov/.minecraft/versions/$ver/$ver.jar && \
	chown -R mcov.mcov /home/mcov/.minecraft

# Expose Overview folder and world folder as volumes to host
VOLUME /ov
VOLUME /mc/world

# Open port(s) to the host for network access
EXPOSE 80/tcp

# Run looping script
ENTRYPOINT ["/start"]
