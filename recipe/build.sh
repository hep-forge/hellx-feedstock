#! /usr/bin/bash
set -e

# curl and plain tar: macOS has no wget, and its tar has no GNU --transform.
curl -fsSLO https://www.roma1.infn.it/~bonvini/hell/downloads/HELLx-data.v3.tgz
tar -xzf HELLx-data.v3.tgz
cp -R HELLx/. .
rm -rf HELLx


NPROC=$(nproc 2>/dev/null || sysctl -n hw.ncpu)
make -j$NPROC

mkdir -p ${PREFIX}/lib
cp -R libhell-x.a ${PREFIX}/lib/
mkdir -p ${PREFIX}/include
cp -R include/* ${PREFIX}/include/
mkdir -p ${PREFIX}/share/hellx.v3
cp -R data ${PREFIX}/share/hellx.v3
mkdir -p ${PREFIX}/bin
cp -R examples/* ${PREFIX}/bin
