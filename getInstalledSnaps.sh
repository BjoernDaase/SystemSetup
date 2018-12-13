#!/bin/bash

#Clear file
> installedSnaps.txt

#Read the information of all snaps
snap list | tail -n +2 | \
while read snap
do
	#Get its name
	snapName=$(eval echo $snap | awk '{print $1;}')
	#Exclude core and, at least on Ubuntu, preinstalled snaps
	if [[ $snapName != *"core"* ]] && [[ $snapName != "gtk-common-themes" ]] && [[ $snapName != "gnome-3-26-1604" ]]; then
		#Get it's channel
		snapChannel=$(eval echo $snap | awk '{print $6;}')
		#If they use a specific channel already write it to its name using the format we need for installtion
		if [[ $snapChannel != "-" ]]; then
			echo $snapName "--"$snapChannel >> installedSnaps.txt
		else
			echo $snapName >> installedSnaps.txt
		fi
	fi
done
