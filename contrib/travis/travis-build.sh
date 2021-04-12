#!/bin/bash
set -ev

BUILD_REPO_URL=https://github.com/thohemp/deeponion-x13-hash

cd build

git clone --branch $TRAVIS_TAG $BUILD_REPO_URL deeponion-x13-hash

docker run --rm \
    -v $(pwd):/root/deeponion-x13-hash \
    -t zebralucky/zbarw-build \
    /root/deeponion-x13-hash/deeponion-x13-hash/contrib/travis/build.sh
