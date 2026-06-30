FROM openquantumsafe/nginx

USER root

COPY --chmod=755 nginx.conf /opt/nginx/nginx-conf/nginx.conf
COPY --chmod=755 entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
