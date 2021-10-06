FROM scratch
COPY --from=traefik:v1.7.32-alpine /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=traefik:v1.7.32-alpine /usr/share/zoneinfo /usr/share/
COPY --from=traefik:v1.7.32-alpine /usr/local/bin/traefik /

EXPOSE 80
VOLUME ["/tmp"]
ENTRYPOINT ["/traefik"]

# Metadata
LABEL org.opencontainers.image.vendor="Traefik Labs" \
	org.opencontainers.image.url="https://traefik.io" \
	org.opencontainers.image.title="Traefik" \
	org.opencontainers.image.description="A modern reverse-proxy" \
	org.opencontainers.image.version="v1.7.32" \
	org.opencontainers.image.documentation="https://docs.traefik.io"
