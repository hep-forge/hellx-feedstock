#! /usr/bin/bash

wget https://www.roma1.infn.it/~bonvini/hell/downloads/HELLx-data.v3.tgz
tar --transform='s,^HELLx/,,' -xzvf HELLx-data.v3.tgz

make -j$(nproc)

mkdir -p ${PREFIX}/lib
cp -R libhell-x.a ${PREFIX}/lib/
mkdir -p ${PREFIX}/include
cp -R include/* ${PREFIX}/include/
mkdir -p ${PREFIX}/share/hellx.v3
cp -R data ${PREFIX}/share/hellx.v3
mkdir -p ${PREFIX}/bin
cp -R examples/* ${PREFIX}/bin
