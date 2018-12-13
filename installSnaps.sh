#!/bin/bash

# Make sure only root can run this script because it's needed by snap.
# Normally that shouldn't be needed because we are called by ínstall.sh
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root because the installation of snap needs root permissions" 1>&2
   exit 1
fi

# Assure Snap is installed
sudo apt install snapd -y

# Install all snaps that are listed in installedSnaps.txt
while read snap
do
	sudo snap install $snap
done < installedSnaps.txt
