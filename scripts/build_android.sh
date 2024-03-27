#!/bin/bash

cd Android_12 || exit 1
source build/envsetup.sh || exit 1
lunch rk3588s_s-userdebug || exit 1
./build.sh -AUKu || exit 1
