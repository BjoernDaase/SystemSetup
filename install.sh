#!/bin/bash

# Make sure only root can run this script because it's needed for the installation
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root because the installation process needs root permissions" 1>&2
   exit 1
fi

sudo ./basicSetup.sh
sudo ./installSnaps.sh
sudo ./installPackages.sh