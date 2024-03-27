#!/bin/bash

docker run --rm -it -v "$(pwd)":/workdir -w /workdir android_12_rockchip_docker
