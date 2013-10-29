#!/bin/bash

if [ -z $1 ] || [ $1 == "--help" ] || [ $1 == "-h" ];
then
	echo "Usage: $0 [version]"
	echo "Upgrades this package to the given version of themes."
	echo "For example, run '$0 2.3.2' to upgrade to version 2.3.2."
	exit
fi

version="$1"
echo "Downloading Bootswatch $version"
wget https://github.com/thomaspark/bootswatch/archive/v$version.zip -O bootstrap.zip
unzip -o bootstrap.zip
for theme in diazotheme/bootswatch/*; 
do 
	new_theme="bootswatch-$version/`basename $theme`"
	if [ -d $theme ] && [ -d $new_theme ]; 
	then 
		cp -f $new_theme/bootstrap.css $theme/css/bootstrap.css
		cp -f $new_theme/bootstrap.min.css $theme/css/bootstrap.min.css
		echo "Upgraded `basename $theme` to $version"
	fi
done
echo "Cleaning up"
rm -rf bootstrap.zip "bootswatch-$version"
