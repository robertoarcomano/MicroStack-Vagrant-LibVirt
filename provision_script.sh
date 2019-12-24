#!/bin/bash

# 1. Set Timezone
env TZ=Europe/Dublin
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 2. Install some useful packages
apt -y install mc bats

# 3. Initialise and mount second disk
pvcreate /dev/vda
vgcreate snap /dev/vda
lvcreate -l100%free -n snap snap
mkfs.ext4 /dev/snap/snap
echo "/dev/snap/snap        /var/snap  ext4    defaults 0       0" >> /etc/fstab
mount -a

# 4. Install and configure Microstack with default values
snap install microstack --edge --classic
microstack.init --auto

# 5. Final message
echo "Please connect to http://10.20.20.1"





