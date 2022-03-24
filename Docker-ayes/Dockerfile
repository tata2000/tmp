# Sourced from https://github.com/uphold/docker-litecoin-core
ARG DEBIAN_VERSION=stable-slim
FROM debian:${DEBIAN_VERSION}

# Get litecoin version 0.18.1, but possible to override
ARG LITECOIN_VERSION=0.18.1



LABEL maintainer.0="João Fonseca (@joaopaulofonseca)" \
  maintainer.1="Pedro Branco (@pedrobranco)" \
  maintainer.2="Rui Marinho (@ruimarinho)" \
  maintainer.3="Tatyana Arenburg"

# Add litecoin user, all necessary OS packages and retrieve gpg keys to validate gosu and litecoin
RUN useradd -r litecoin \
  && apt-get update -y \
  && apt-get upgrade -y \
  && apt-get install -y curl gnupg \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && set -ex \
  && for key in \
    B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    FE3348877809386C \
  ; do \
    gpg --no-tty --keyserver hkps://keyserver.ubuntu.com --recv-keys "$key" || \
    gpg --no-tty --keyserver pgp.mit.edu --recv-keys "$key" || \
    gpg --no-tty --keyserver keyserver.pgp.com --recv-keys "$key" || \
    gpg --no-tty --keyserver ha.pool.sks-keyservers.net --recv-keys "$key" || \
    gpg --no-tty --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys "$key" ; \
  done

# Get Gosu version 1.14
ENV GOSU_VERSION=1.14

# Download gosu and verify checksum.  
RUN curl -o /usr/local/bin/gosu -fSL https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-$(dpkg --print-architecture) \
  && curl -o /usr/local/bin/gosu.asc -fSL https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-$(dpkg --print-architecture).asc \
  && gpg --verify /usr/local/bin/gosu.asc \
  && rm /usr/local/bin/gosu.asc \
  && chmod +x /usr/local/bin/gosu

ENV LITECOIN_DATA=/home/litecoin/.litecoin

# Download litecoin and verify checksum.
RUN curl -SLO https://download.litecoin.org/litecoin-${LITECOIN_VERSION}/linux/litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz \
  && curl -SLO https://download.litecoin.org/litecoin-${LITECOIN_VERSION}/linux/litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz.asc \
  && gpg --verify litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz.asc litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz\
  && tar --strip=2 -xzf *.tar.gz -C /usr/local/bin \
  && rm *.tar.gz*

# Copy the entrypoint script into the container
COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Create a mount point 
VOLUME ["/home/litecoin/.litecoin"]

# Expose all of the ports below
EXPOSE 9332 9333 19332 19333 19444

# Start the entrypoint script
ENTRYPOINT ["/entrypoint.sh"]

# Start the litecoind as default argument
CMD ["litecoind"]
