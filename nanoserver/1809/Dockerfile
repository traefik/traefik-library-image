FROM mcr.microsoft.com/windows/nanoserver:1809

USER ContainerAdministrator
COPY --from=traefik:v2.4.8-windowsservercore-1809 \
    C:\\traefik.exe C:\\traefik.exe

EXPOSE 80
ENTRYPOINT [ "/traefik" ]

# Metadata
LABEL org.opencontainers.image.vendor="Traefik Labs" \
    org.opencontainers.image.url="https://traefik.io" \
    org.opencontainers.image.title="Traefik" \
    org.opencontainers.image.description="A modern reverse-proxy" \
    org.opencontainers.image.version="v2.4.8" \
    org.opencontainers.image.documentation="https://docs.traefik.io"
