#!/bin/sh

# for removing and reinstalling 
sudo dkms remove -m asus-wmi -v 1.0 --all
sudo rm -r /usr/src/asus-wmi-1.0


sudo mkdir /usr/src/asus-wmi-1.0
cd /usr/src/asus-wmi-1.0
sudo wget 'https://github.com/Plippo/asus-wmi-screenpad/archive/master.zip'
sudo unzip master.zip
sudo mv asus-wmi-screenpad-master/* .
sudo rmdir asus-wmi-screenpad-master
sudo rm master.zip

sudo sh prepare-for-current-kernel.sh

sudo dkms add -m asus-wmi -v 1.0

sudo dkms build -m asus-wmi -v 1.0
# sudo dkms install -m asus-wmi -v 1.0 # added modified line below
sudo dkms install -m asus-wmi -v 1.0 --force
