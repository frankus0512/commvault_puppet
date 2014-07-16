commvault_puppet
================
This is a puppet module that is created to work with Vagrant as new systems are deployed; tested on CentOS 6.5 x86_64 version.

Instructions on how to use this module:
 - Copy the commvault installer bundle under modules/commvault/files/ as linux-x86_64.tar.gz
 - This module will only install the FS iDA and MA
 - Vagrantfile MUST pass the hostname and any interface other than the private_internal
 - You may still mount the ISO at any later time to install additional iDA's.
