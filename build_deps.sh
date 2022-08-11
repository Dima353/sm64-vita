#!/bin/bash

mkdir deps
cd deps

# Build and install vitaGL, mathneon and vitaShaRK

git clone https://github.com/Rinnegatamante/vitaGL.git
cd vitaGL
git checkout 700f7ac
make HAVE_SBRK=1 HAVE_SHARK=1 install
wait
cd ..

git clone https://github.com/Rinnegatamante/vitaShaRK.git
cd vitaShaRK
git checkout 7264cea
make install
wait
cd ../../

