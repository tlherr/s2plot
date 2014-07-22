#!/bin/bash

echo "Updating Packages";
sudo apt-get update;
name=$(uname -r);
echo "Installing Headers/Build Essentials/Wget/Csh";
sudo apt-get install linux-headers-$name build-essential wget csh;
cd ~/;
echo "Downloading s2plot 3.2.1";
wget http://astronomy.swin.edu.au/s2plot/versions/s2plot-3.2.1.tar.bz2;
echo "Expanding Archive";
bunzip2 s2plot-3.2.1.tar.bz2;
tar -xvf s2plot-3.2.1.tar;

echo "Moving into /usr/local";
sudo mkdir /usr/local/s2plot;
sudo cp -r s2plot-3.2.1/* /usr/local/s2plot;

# this is literally hitler but w/e

sudo chmod -R 777 /usr/local/s2plot;
