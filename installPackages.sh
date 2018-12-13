#!/bin/bash

# Make sure only root can run this script because it's needed by apt.
# Normally that shouldn't be needed because we are called by ínstall.sh
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root because the installation of packages (apt) needs root permissions" 1>&2
   exit 1
fi

#Add the PPA for Fsearch
sudo add-apt-repository -y ppa:christian-boxdoerfer/fsearch-daily

#Add the PPA for Timeshift
sudo apt-add-repository -y ppa:teejee2008/ppa

#Install Chrome
sudo apt-get install libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome*.deb

#Add 32 bit architeture
sudo dpkg --add-architecture i386

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install libx11-6:i386 libstdc++5:i386 libpam0g:i386 hplip virtualbox-qt -y #gcc-8 g++-8


# Install all packages that are listed in installedSnaps.txt
while read package
do
	sudo sudo apt install $package
done < installedPackages.txt
