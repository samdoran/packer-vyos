#!/bin/vbash
source /opt/vyatta/etc/functions/script-template

# set system package repository helium components 'main contrib non-free'
# set system package repository helium distribution 'helium'
# set system package repository helium url 'http://dev.packages.vyos.net/repositories/legacy/vyos'
delete system package
set system package repository squeeze components 'main contrib non-free'
set system package repository squeeze distribution 'squeeze'
set system package repository squeeze url 'http://archive.debian.org/debian'
# set system package repository community components 'main'
# set system package repository community distribution 'current'
# set system package repository community url 'http://dev.packages.vyos.net/repositories/current/vyos/'
set system package repository squeeze-lts components 'main contrib non-free'
set system package repository squeeze-lts distribution 'squeeze-lts'
set system package repository squeeze-lts url 'http://archive.debian.org/debian'
set system login user vagrant authentication public-keys vagrant_insecure_public
set system login user vagrant authentication public-keys vagrant_insecure_public type ssh-rsa
set system login user vagrant authentication public-keys vagrant_insecure_public key AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ==
delete interfaces ethernet eth0 hw-id

commit
save
exit
