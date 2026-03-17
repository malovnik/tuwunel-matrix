FROM ghcr.io/matrix-construct/tuwunel:latest AS tuwunel-src

FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends nginx ca-certificates && \
    rm -rf /var/lib/apt/lists/*

COPY --from=tuwunel-src / /tuwunel-root/
RUN cp /tuwunel-root/usr/bin/tuwunel /usr/local/bin/tuwunel 2>/dev/null || \
    cp /tuwunel-root/usr/local/bin/tuwunel /usr/local/bin/tuwunel 2>/dev/null || \
    find /tuwunel-root -name tuwunel -type f -exec cp {} /usr/local/bin/tuwunel \; && \
    chmod +x /usr/local/bin/tuwunel && \
    rm -rf /tuwunel-root

COPY tuwunel.toml /etc/tuwunel.toml
COPY nginx.conf /etc/nginx/sites-enabled/default
COPY register/ /register/
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 8080

CMD ["/start.sh"]
