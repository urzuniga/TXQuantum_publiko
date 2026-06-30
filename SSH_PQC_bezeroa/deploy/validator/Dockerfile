FROM ubuntu:26.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y openssh-client sshpass bash ca-certificates && rm -rf /var/lib/apt/lists/*
COPY client_test.sh /validator/client_test.sh
RUN chmod +x /validator/client_test.sh
ENTRYPOINT ["/validator/client_test.sh"]
