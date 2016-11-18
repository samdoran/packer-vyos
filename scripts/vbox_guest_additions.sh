#!/bin/bash

# Install packages needed for Guest Additions installation
apt-get update
aptitude -y install build-essential
aptitude -y install bzip2
aptitude -y install dkms
aptitude -y install linux-vyatta-kbuild

ln -s /usr/src/linux-image/debian/build/build-amd64-none-amd64-vyos "/lib/modules/$(uname -r)/build"

# Install Guest Additions
mount -o loop,ro ~/VBoxGuestAdditions.iso /mnt/
/mnt/VBoxLinuxAdditions.run
umount /mnt/
rm -f ~/VBoxGuestAdditions.iso

# Install init scripts and enable service
cp /opt/VBoxGuestAdditions*/init/{vboxadd,vboxadd-service} /etc/init.d/
update-rc.d vboxadd defaults
update-rc.d vboxadd-service defaults
