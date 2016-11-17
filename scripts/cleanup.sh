#!/bin/bash

set -e
set -x

# Fix slow DNS
sudo sed -i 's/UseDNS.*$/UseDNS no/' /etc/ssh/sshd_config

# Disable TTYs in run levers 2-6
sudo sed -i -e 's,^.*:/sbin/getty\s\+.*\s\+tty[2-6],#\0,' /etc/inittab

# Clean apt cache
sudo aptitude -y clean

# Zero out the rest of the free space using dd, then delete the written file.
echo "Reclaming free space on disk"
sudo dd if=/dev/zero of=/EMPTY bs=1M || :
sudo rm -f /EMPTY

# Add `sync` so Packer doesn't quit too early, before the large file is deleted.
sudo sync

