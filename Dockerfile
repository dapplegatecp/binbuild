FROM ubuntu:22.04
RUN echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf.d/00-docker
RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf.d/00-docker
RUN DEBIAN_FRONTEND=noninteractive \
  apt-get update \
  && apt-get install -y perl wget curl ca-certificates bzip2 make\
  && rm -rf /var/lib/apt/lists/*

# Download the toolchain
RUN mkdir /toolchain && wget https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--musl--stable-2022.08-2.tar.bz2 && \
  tar -xvf aarch64--musl--stable-2022.08-2.tar.bz2 -C toolchain --strip-components 1 && rm aarch64--musl--stable-2022.08-2.tar.bz2

COPY ./build /build

RUN mkdir /staging

WORKDIR /build

CMD make && make install && bash
