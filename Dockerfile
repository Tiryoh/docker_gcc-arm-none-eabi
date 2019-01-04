FROM debian:stretch

RUN apt-get update \
    && apt-get -y install make wget bzip2 libc6-i386
ENV GCC_ARM gcc-arm-none-eabi-4_9-2015q3
ENV UPSTREAM_URL https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q3-update/+download/gcc-arm-none-eabi-4_9-2015q3-20150921-linux.tar.bz2
RUN wget -O $GCC_ARM-linux.tar.bz2 $UPSTREAM_URL && tar xvf $GCC_ARM-linux.tar.bz2 -C /usr/local && rm -rf $GCC_ARM-linux.tar.bz2
ENV PATH /usr/local/$GCC_ARM/bin:/usr/local/$GCC_ARM/arm-none-eabi/bin:$PATH

WORKDIR /source
CMD ["make"]
