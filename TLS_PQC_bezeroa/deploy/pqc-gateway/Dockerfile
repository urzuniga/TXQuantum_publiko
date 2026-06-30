
FROM openquantumsafe/oqs-ossl3
RUN apk update && apk add --no-cache bash coreutils
COPY entrypoint.sh /opt/quantum-gate/entrypoint.sh
RUN chmod 755 /opt/quantum-gate/entrypoint.sh
EXPOSE 4433
ENTRYPOINT ["/opt/quantum-gate/entrypoint.sh"]
