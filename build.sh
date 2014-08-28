#!/bin/bash

echo "Setting Environment Variables";

architecture=`uname -m`;
export S2PATH=/usr/local/s2plot;
export S2ARCH="linux-gnu-$architecture";
export S2PLOT_TEXPATH=${S2PATH}/textures
export LD_LIBRARY_PATH="${S2PATH}/${S2ARCH}";
export S2SHARED=yes                   
export S2FREEGLUT=yes                 
export S2FREETYPE=yes  
export S2PLOT_PRCDRIVER=s2prcwriter     

export S2LIBCOMPILER="gcc -fopenmp -lGL -lglut";

export S2CCMPILER="gcc -c -D_GNU_SOURCE -I/usr/local/s2plot/src -m64 -O3 -ftree-vectorize -fopenmp -Wall -DS2FREETYPE"


echo "Updating Packages";
sudo apt-get update;
name=$(uname -r);
echo "Installing Headers/Build Essentials/Wget/Csh";
sudo apt-get install -y linux-headers-$name build-essential wget csh libhpdf-2.2.1 libhpdf-dev freeglut3 freeglut3-dev libfreetype6 libfreetype6-dev zip unzip;

cd ~/;
echo "Downloading s2plot 3.2.1";
wget https://github.com/tlherr/s2plot/releases/download/1.0/s2plot.zip;
echo "Expanding Archive";
unzip s2plot.zip;

echo "Moving into /usr/local";
sudo mkdir /usr/local/s2plot;
sudo cp -r s2plot/* /usr/local/s2plot;
sudo ln -s /usr/lib/x86_64-linux-gnu/libXpm.so.4 /usr/lib/x86_64-linux-gnu/libXpm.so

./install.csh

echo "Running Test";

./linux-gnu-x86_64/s2view
