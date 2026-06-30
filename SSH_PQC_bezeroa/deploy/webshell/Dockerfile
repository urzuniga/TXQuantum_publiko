FROM ubuntu:26.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y ttyd openssh-client sshpass bash ca-certificates netcat-openbsd && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
COPY motd.txt /motd.txt
COPY student_helpers /student_helpers
RUN chmod 755 /entrypoint.sh && chmod -R 755 /student_helpers

EXPOSE 7681
ENTRYPOINT ["/entrypoint.sh"]
