FROM ubuntu:jammy-20240808

LABEL org.opencontainers.image.licenses=MIT
LABEL org.opencontainers.image.description="Up-to-date container built to serve a multitude of utilities for extracting hashes from network capture files"
LABEL org.opencontainers.image.source=https://github.com/ThatOnePasswordWas40Passwords/pcap-extractor

ENV DEBIAN_FRONTEND=NONINTERACTIVE

RUN apt update && apt-get upgrade -y && apt install -y --no-install-recommends \
  build-essential \
  gcc \
  git \
  libcurl4-gnutls-dev \
  ca-certificates \
  libssl-dev \
  zlib1g-dev \
  pkg-config \
  ccache && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /tmp
RUN git clone --depth 1 https://github.com/ZerBea/hcxtools.git && \
  cd hcxtools && \
  make && \
  make install && \
  cd .. && \
  rm -rf hcxtools

RUN apt-get remove -yq \
  build-essential \
  gcc \
  git \
  libcurl4-gnutls-dev \
  ca-certificates \
  libssl-dev \
  zlib1g-dev \
  pkg-config \
  ccache
