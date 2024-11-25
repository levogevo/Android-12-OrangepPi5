#!/bin/bash

git config --global --add safe.directory /workdir
export PATH="/usr/lib/ccache:$PATH"

cd Android_12 || exit 1
source build/envsetup.sh || exit 1
lunch rk3588s_s-userdebug || exit 1
export CFLAGS="-v"
./build.sh -AUKu || exit 1
