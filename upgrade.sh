#!/bin/bash

if [ "$1" == "--help" ] || [ "$1" == "-h" ];
then
	echo "Usage: $0"
	echo "Upgrades ths package to the latest version of Bootswatch 2 themes."
	exit
fi

version="$1"
echo "Downloading latest Bootswatch"
for theme in diazotheme/bootswatch/*; 
do 
	theme_id="`basename $theme`"
	if [ -d $theme ] && [ -d $theme/css ]; 
	then 
		wget http://bootswatch.com/2/$theme_id/bootstrap.css -O $theme/css/bootstrap.css
		wget http://bootswatch.com/2/$theme_id/bootstrap.min.css -O $theme/css/bootstrap.min.css
		echo "Upgraded $theme_id to latest version."
	fi
done
