FROM ubuntu:18.04

MAINTAINER papalimahotel

# Add custom files
ADD entrypoint.sh /
ADD config.py /

# Update apt repository and install required packages
RUN apt-get update
RUN apt-get install -y git wget python3 python3-pip python3-pil nginx

# Add python packages
RUN pip3 install numpy
RUN pip3 install Pillow

# Grab Minecraft-Overviwer source from github and compile
RUN mkdir -p /usr/src/app/overviewer
WORKDIR /usr/src/app/overviewer
RUN git clone https://github.com/overviewer/Minecraft-Overviewer.git .
RUN python3 ./setup.py build

# Start the web server
RUN service nginx start

# Create world data folder & expose as volume to host
RUN mkdir -p /data/world
VOLUME /data/world

# Open port(s) to the host for network access
EXPOSE 80/tcp

# Run looping script
ENTRYPOINT /entrypoint.sh
