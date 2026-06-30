FROM ubuntu:26.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    openssh-server \
    openssh-client \
    openssl \
    bash \
    ca-certificates \
    netcat-openbsd \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/sshd /data

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

EXPOSE 2222

ENTRYPOINT ["/entrypoint.sh"]
