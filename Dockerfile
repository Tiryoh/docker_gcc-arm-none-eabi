FROM debian:stretch

RUN apt-get update \
    && apt-get -y install make wget bzip2
ENV GCC_ARM gcc-arm-none-eabi-7-2018-q2-update
ENV UPSTREAM_URL https://developer.arm.com/-/media/Files/downloads/gnu-rm/7-2018q2/gcc-arm-none-eabi-7-2018-q2-update-linux.tar.bz2?revision=bc2c96c0-14b5-4bb4-9f18-bceb4050fee7?product=GNU%20Arm%20Embedded%20Toolchain,64-bit,,Linux,7-2018-q2-update
RUN wget -O $GCC_ARM-linux.tar.bz2 $UPSTREAM_URL && tar xvf $GCC_ARM-linux.tar.bz2 -C /usr/local && rm -rf $GCC_ARM-linux.tar.bz2
ENV PATH /usr/local/$GCC_ARM/bin:/usr/local/$GCC_ARM/arm-none-eabi/bin:$PATH

WORKDIR /source
CMD ["make"]
