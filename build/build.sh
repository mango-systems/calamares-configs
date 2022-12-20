#!/bin/bash
## this script is made to make debug easy and easy creation of packages for fast debugging

# Check if the script is being run with sudo
# if [ $(id -u) -ne 0 ]; then
#   # Prompt for the password
#   sudo -p "Enter password to run the script with sudo: " bash $0
#   exit
# fi


# DESTDIR=/path/to/destination make
project_name="calamares-configs-mango-linux"
explicit_version="" 
#for debugging purposes, version is not explicitly mentioned, mention for final build

time=$(date "+%Y-%m-%d_%H-%M-%S")


# Set the value of $version to $date if $version is empty
version=${explicit_version:=$time}

# Print the output
package_name="$project_name-$version"

echo "Package name: $package_name"

cp -r template $package_name
# copies the template dir, and renames to $package_name

mkdir $package_name/modules $package_name/branding

cp ../settings.conf ./$package_name/
cp -r ../src/modules/* ./$package_name/modules
cp -r ../src/branding/* ./$package_name/branding

cd $package_name

# build the .deb pkg
# sudo chmod +x ./debian/*

dpkg-source --before-build .
dpkg-buildpackage -rfakeroot -D -us -uc -b

# chown $USER:$USER ../$package_name*.deb
# chown $USER:$USER ../$package_name*.buildinfo
# chown $USER:$USER ../$package_name*.changes
