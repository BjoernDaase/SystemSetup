#!/bin/bash

#Clea file
> installedPackages.txt

comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u) | \
while read packageName
do
	#Exclude development package,beacuse they were installed while testing
	if [[ $packageName != *"-dev" ]] && [[ $packageName != *"-docs"* ]] && [[ $packageName != *"hunspell"* ]] && [[ $packageName != *"hyphen"* ]] && [[ $packageName != *"mythes"* ]] && [[ $packageName != "python-"* ]] && [[ $packageName != "python3-"* ]] && [[ $packageName != "libinput-"* ]]; then 
		echo $packageName >> installedPackages.txt
	fi
done