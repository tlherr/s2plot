#!/bin/csh

echo "Setting Environment Variables";

set architecture = `uname -m`;
setenv S2PATH /usr/local/s2plot;
setenv S2ARCH "linux-gnu-$architecture";
setenv S2PLOT_TEXPATH ${S2PATH}/textures
setenv LD_LIBRARY_PATH "${S2PATH}/${S2ARCH}";

setenv S2LIBCOMPILER "gcc -fopenmp -lGL -lglut";

setenv S2CCMPILER "gcc -c -D_GNU_SOURCE -I/usr/local/s2plot/src -m64 -O3 -ftree-vectorize -fopenmp -Wall -DS2FREETYPE"

echo "Symlinking GCC Because s2plot is fucking retard"

cd /usr/local;
mkdir gcc;
cd gcc;
mkdir "4.4.5";
cd "4.4.5";
mkdir bin;
cd bin;
ln -s /usr/bin/gcc .;


echo 'Attempting to build';
cd /usr/local/s2plot;

./scripts/build-lib.csh;

cd /usr/local/s2plot;

./scripts/build-apps.csh;

cd /usr/local/s2plot;

./scripts/build-viewer.csh;

cd /usr/local/s2plot;

./scripts/build-examples.csh;

cd /usr/local/s2plot;

./scripts/build-prc-module.csh;

echo "Testing if this shit worked son";
