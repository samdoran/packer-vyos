#!/bin/bash

# Install packages needed for Guest Additions installation
apt-get -o Acquire::Check-Valid-Until=false update
apt-get -y --force-yes install build-essential
apt-get -y --force-yes install bzip2
apt-get -y --force-yes install dkms

# The repository structure was changed in March 2017 and the linux-vyatta-kbuild
# package points to a URL that is no longer valid
# As a workaround, manually download and install the file

# aptitude -y install linux-vyatta-kbuild
wget -P /tmp http://dev.packages.vyos.net/repositories/legacy/vyos/pool/main/l/linux-3.13/linux-vyatta-kbuild_3.13.11-1+vyos1+helium14_amd64.deb
dpkg -i /tmp/linux-vyatta-kbuild_3.13.11-1+vyos1+helium14_amd64.deb
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
