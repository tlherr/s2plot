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

echo "Symlinking GCC Because s2plot is fucking retard"

cd /usr/local;
mkdir gcc;
cd gcc;
mkdir "4.4.5";
cd "4.4.5";
mkdir bin;
cd bin;
ln -s /usr/bin/gcc .;


echo "Updating Packages";
sudo apt-get update;
name=$(uname -r);
echo "Installing Headers/Build Essentials/Wget/Csh";
sudo apt-get install linux-headers-$name build-essential wget libhpdf-2.2.1 libhpdf-dev freeglut3 
freeglut3-dev libfreetype6 libfreetype6-dev;
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
# sudo chmod -R 777 /usr/local/s2plot;


echo 'Attempting to build';
cd /usr/local/s2plot;

./scripts/build-lib.csh;
./scripts/build-apps.csh;
./scripts/build-viewer.csh;
./scripts/build-examples.csh;
./scripts/build-prc-module.csh;

echo "Fin";
