FROM alpine:$ALPINE_VERSION
RUN apk --no-cache add ca-certificates tzdata
RUN set -ex; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		armhf) arch='arm' ;; \
		aarch64) arch='arm64' ;; \
		x86_64) arch='amd64' ;; \
		*) echo >&2 "error: unsupported architecture: $apkArch"; exit 1 ;; \
	esac; \
	wget --quiet -O /usr/local/bin/traefik "https://github.com/traefik/traefik/releases/download/$VERSION/traefik_linux-$arch"; \
	chmod +x /usr/local/bin/traefik; \
	apk add libcap; \
	setcap 'cap_net_bind_service=+ep' /usr/local/bin/traefik; \
	apk del libcap
COPY entrypoint.sh /
EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]
CMD ["traefik"]

# Metadata
LABEL org.opencontainers.image.vendor="traefik" \
	org.opencontainers.image.url="https://traefik.io" \
	org.opencontainers.image.title="Traefik" \
	org.opencontainers.image.description="A modern reverse-proxy" \
	org.opencontainers.image.version="$VERSION" \
	org.opencontainers.image.documentation="https://docs.traefik.io"
