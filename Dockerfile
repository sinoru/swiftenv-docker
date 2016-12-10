FROM debian:stable-slim

RUN apt-get update && apt-get install -y \
    clang \
    git \
 && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
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
 && rm -rf /var/lib/apt/lists/*

ENV HOME="/root"

ENV SWIFTENV_ROOT="$HOME/.swiftenv"
ENV PATH="$SWIFTENV_ROOT/bin:$PATH"

RUN git clone https://github.com/sinoru/swiftenv.git $SWIFTENV_ROOT --branch verbose-fix && \
	echo 'eval "$(swiftenv init -)"' >> ~/.bash_profile

ADD .swiftenv/share/swiftenv-build/* $SWIFTENV_ROOT/share/swiftenv-build/

RUN swiftenv install --build --verbose 3.0.1

# Clean up when done.
RUN rm -rf /tmp/* /var/tmp/*
