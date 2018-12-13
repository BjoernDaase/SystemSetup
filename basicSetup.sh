#!/bin/bash

# Make sure only root can run this script because it's needed by snx.
# Normally that shouldn't be needed because we are called by ínstall.sh
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root because some steps needs root permissions" 1>&2
   exit 1
fi

#Install SNX (run script)
wget https://vpn.hpi.de/CSHELL/snx_install.sh --no-check-certificate
chmod +x snx_install.sh
sudo ./snx_install.sh

#Move snx config file to home
cp .snxrc ~ -v

#Make sure set the samba protocol is set to version 2 by adding directly under the [global] tag in /etc/samba/smb.conf
#sudo touch /etc/samba/smb.conf.tmp
#sudo sed '/\[global\]/a min protocol = SMB2 \nmax protocol = SMB2 \nclient min protocol = SMB2 \nclient max protocol = SMB2' /etc/samba/smb.conf | sudo tee /etc/samba/smb.conf.tmp
#sudo rm /etc/samba/smb.conf
#sudo mv /etc/samba/smb.conf.tmp /etc/samba/smb.conf

#Set bookmarks for Nemo/Nautilus
echo "file:///home/bjoern/HPI HPI
file:///home/bjoern/HPI/HPILarsBjoern HPILarsBjoern
file:///home/bjoern/HPI/Dropbox Dropbox
smb://bjoern.daase@fs23/lehrveranstaltungen/ Lehrveranstaltungen
smb://bjoern.daase@fs23/projekte$/bp2018/bp2018rh1 Bachelorprojekt" >> ~/.config/gtk-3.0/bookmarks

