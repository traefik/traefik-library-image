FROM mcr.microsoft.com/windows/nanoserver:ltsc2022

COPY --from=traefik:v3.1.6-windowsservercore-ltsc2022 /traefik.exe /

EXPOSE 80
ENTRYPOINT [ "/traefik" ]

# Metadata
LABEL org.opencontainers.image.vendor="Traefik Labs" \
    org.opencontainers.image.url="https://traefik.io" \
    org.opencontainers.image.source="https://github.com/traefik/traefik" \
    org.opencontainers.image.title="Traefik" \
    org.opencontainers.image.description="A modern reverse-proxy" \
    org.opencontainers.image.version="v3.1.6" \
    org.opencontainers.image.documentation="https://docs.traefik.io"
