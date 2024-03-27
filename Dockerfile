from debian:bookworm

RUN echo 'deb http://archive.debian.org/debian/ stretch contrib main non-free' >> /etc/apt/sources.list || exit
RUN apt update && apt full-upgrade -qy || exit 
RUN apt install -qy nala || exit 

ENV DEBIAN_FRONTEND=noninteractive 
ENV TZ=America/Chicago
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# from documentation pdf
RUN nala install -y git gnupg flex bison gperf build-essential \
    zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
    lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev ccache \
    libgl1-mesa-dev libxml2-utils xsltproc unzip u-boot-tools || exit 

# not from documentation
RUN nala install -y procps python2.7 libncurses5 libncurses5-dev \
    bc libssl-dev libelf-dev
RUN ln -snf /bin/python2.7 /bin/python
RUN ln -snf /bin/python2.7 /bin/python2

RUN ln -snf /bin/bash /bin/sh
