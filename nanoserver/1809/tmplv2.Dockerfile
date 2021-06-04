FROM mcr.microsoft.com/windows/nanoserver:1809

USER ContainerAdministrator
COPY --from=traefik:${VERSION}-windowsservercore-1809 \
    C:\\traefik.exe C:\\traefik.exe

EXPOSE 80
ENTRYPOINT [ "/traefik" ]

# Metadata
LABEL org.opencontainers.image.vendor="Traefik Labs" \
    org.opencontainers.image.url="https://traefik.io" \
    org.opencontainers.image.title="Traefik" \
    org.opencontainers.image.description="A modern reverse-proxy" \
    org.opencontainers.image.version="$VERSION" \
    org.opencontainers.image.documentation="https://docs.traefik.io"
