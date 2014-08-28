#!/bin/csh

echo 'Attempting to build';
cd /usr/local/s2plot;

setenv architecture `uname -m`;
setenv S2PATH /usr/local/s2plot;
setenv S2ARCH "linux-gnu-$architecture";
setenv S2PLOT_TEXPATH ${S2PATH}/textures
setenv LD_LIBRARY_PATH "${S2PATH}/${S2ARCH}";
setenv S2SHARED yes
setenv S2FREEGLUT yes
setenv S2FREETYPE yes
setenv S2PLOT_PRCDRIVER s2prcwriter
setenv S2LIBCOMPILER "gcc -fopenmp -lGL -lglut";
setenv S2CCMPILER "gcc -c -D_GNU_SOURCE -I/usr/local/s2plot/src -m64 -O3 -ftree-vectorize -fopenmp -Wall -DS2FREETYPE"


csh scripts/build.csh;
