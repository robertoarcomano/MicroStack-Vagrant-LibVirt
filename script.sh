#!/bin/bash
env TZ=Europe/Dublin
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install Microstack on Ubuntu
snap install microstack --edge --classic

# Configure Microstack with default values
microstack.init --auto

# Final message
echo "Please connect to http://192.168.10.2"









