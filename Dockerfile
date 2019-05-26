FROM debian:stretch

RUN apt-get update \
    && apt-get -y install make wget bzip2
ENV GCC_ARM gcc-arm-none-eabi-8-2018-q4-major
ENV UPSTREAM_URL https://developer.arm.com/-/media/Files/downloads/gnu-rm/8-2018q4/gcc-arm-none-eabi-8-2018-q4-major-linux.tar.bz2?revision=d830f9dd-cd4f-406d-8672-cca9210dd220?product=GNU%20Arm%20Embedded%20Toolchain,64-bit,,Linux,8-2018-q4-major
RUN wget -O $GCC_ARM-linux.tar.bz2 $UPSTREAM_URL && tar xvf $GCC_ARM-linux.tar.bz2 -C /usr/local && rm -rf $GCC_ARM-linux.tar.bz2
ENV PATH /usr/local/$GCC_ARM/bin:/usr/local/$GCC_ARM/arm-none-eabi/bin:$PATH

WORKDIR /source
CMD ["make"]
