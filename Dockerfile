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
