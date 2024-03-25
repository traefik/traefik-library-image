FROM mcr.microsoft.com/windows/nanoserver:1809

USER ContainerAdministrator
COPY --from=traefik:v1.7.30-windowsservercore-1809 \
    /windows/system32/netapi32.dll /windows/system32/netapi32.dll
COPY --from=traefik:v1.7.30-windowsservercore-1809 \
    /traefik.exe /traefik.exe

EXPOSE 80
ENTRYPOINT [ "/traefik" ]

# Metadata
LABEL org.opencontainers.image.vendor="Traefik Labs" \
    org.opencontainers.image.url="https://traefik.io" \
    org.opencontainers.image.title="Traefik" \
    org.opencontainers.image.description="A modern reverse-proxy" \
    org.opencontainers.image.version="v1.7.30" \
    org.opencontainers.image.documentation="https://docs.traefik.io"
