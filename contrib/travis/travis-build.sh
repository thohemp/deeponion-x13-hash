#!/bin/bash
set -ev

BUILD_REPO_URL=https://github.com/zebra-lucky/x11_hash

cd build

git clone --branch $TRAVIS_TAG $BUILD_REPO_URL x11_hash

docker run --rm \
    -v $(pwd):/root/x11_hash \
    -t zebralucky/zbarw-build \
    /root/x11_hash/x11_hash/contrib/travis/build.sh
