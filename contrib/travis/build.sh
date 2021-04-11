#!/bin/bash

BUILD_DIR=/root/deeponion-x13-hash
SRC_DIR=$BUILD_DIR/deeponion-x13-hash

# win32
cd $SRC_DIR
source contrib/travis/version_env.sh

git clean -fd

autoreconf -fi

./configure --host=i686-w64-mingw32 --prefix=/usr/local/win32
make

BUILD32=$BUILD_DIR/win32
mkdir -p $BUILD32/deeponion-x13-hash
cp $SRC_DIR/.libs/libx13hash-0.dll $BUILD32/deeponion-x13-hash
cd $BUILD32
zip -r $BUILD_DIR/deeponion-x13-hash-$X13HASH_VERSION-win32.zip deeponion-x13-hash

# win64
cd $SRC_DIR

git clean -fd

autoreconf -fi

./configure --host=x86_64-w64-mingw32 --prefix=/usr/local/win64
make

BUILD64=$BUILD_DIR/win64
mkdir -p $BUILD64/deeponion-x13-hash
cp $SRC_DIR/.libs/libx13hash-0.dll $BUILD64/deeponion-x13-hash
cd $BUILD64
zip -r $BUILD_DIR/deeponion-x13-hash-$X11HASH_VERSION-win64.zip deeponion-x13-hash
