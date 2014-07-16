commvault_puppet
================
This is a puppet module that is created to work with Vagrant as new systems are deployed; tested on CentOS 6.5 x86_64 version.

Instructions on how to use this module:
 - Copy the commvault installer bundle under modules/commvault/files/ as linux-x86_64.tar.gz
 - This module will only install the FS iDA and MA
 - Vagrantfile MUST pass the hostname and any interface other than the private_internal
 - You may still mount the ISO at any later time to install additional iDA's.
 - cv_fsida.xml is a parameter file for the silent installation and will only install a FS iDA by default (more information on how to generate custom parameter file such as databases can be found on http://documentation.commvault.com/commvault/v10/article?p=deployment/install/unix_silent.htm#Install_Using_XML_File)
