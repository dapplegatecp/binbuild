FROM ubuntu:22.04
RUN echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf.d/00-docker
RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf.d/00-docker
RUN DEBIAN_FRONTEND=noninteractive \
  apt-get update \
  && apt-get install -y perl wget curl ca-certificates bzip2 make git cmake pkg-config patch\
  && rm -rf /var/lib/apt/lists/*

# Download the toolchain
RUN mkdir /toolchain && wget https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--uclibc--stable-2022.08-1.tar.bz2 && \
  tar -xvf aarch64--uclibc--stable-2022.08-1.tar.bz2 -C toolchain --strip-components 1 && rm aarch64--uclibc--stable-2022.08-1.tar.bz2

RUN mkdir -p /builds/buildroot.org/toolchains-builder/build/ && ln -s /toolchain /builds/buildroot.org/toolchains-builder/build/aarch64--uclibc--stable-2022.08-1
RUN cd /toolchain/share/aclocal/ && ln -s /usr/share/aclocal/pkg.m4

COPY ./build /build

RUN mkdir /output

WORKDIR /build

CMD make && make install && bash
