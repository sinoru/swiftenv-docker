FROM debian:stable-slim

ENV SWIFTENV_ROOT="/root/.swiftenv" \
    PATH="/root/.swiftenv/bin:$PATH"

RUN apt-get update && apt-get install --no-install-recommends -y \
    clang \
    git \
    ca-certificates \
    && \
    git clone https://github.com/sinoru/swiftenv.git $SWIFTENV_ROOT --branch verbose-fix \
    && \
    echo 'eval "$(swiftenv init -)"' >> ~/.bash_profile \
    && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD .swiftenv/share/swiftenv-build/* $SWIFTENV_ROOT/share/swiftenv-build/

RUN echo $SWIFTENV_ROOT

RUN apt-get update && apt-get install --no-install-recommends -y \
    cmake \
    ninja-build \
    python \
    uuid-dev \
    libicu-dev \
    icu-devtools \
    libbsd-dev \
    libedit-dev \
    libxml2-dev \
    libsqlite3-dev \
    swig \
    libpython-dev \
    libncurses5-dev \
    pkg-config \
    libblocksruntime-dev \
    libcurl4-openssl-dev \
    autoconf \
    libtool \
    systemtap-sdt-dev \
    && \
    swiftenv install --build --verbose 3.0.1 \
    && \
    apt-get remove --purge --auto-remove -y \
    cmake \
    ninja-build \
    python \
    uuid-dev \
    libicu-dev \
    icu-devtools \
    libbsd-dev \
    libedit-dev \
    libxml2-dev \
    libsqlite3-dev \
    swig \
    libpython-dev \
    libncurses5-dev \
    pkg-config \
    libblocksruntime-dev \
    libcurl4-openssl-dev \
    autoconf \
    libtool \
    systemtap-sdt-dev \
    && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
