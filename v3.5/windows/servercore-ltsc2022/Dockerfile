FROM  mcr.microsoft.com/windows/servercore:ltsc2022
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN Invoke-WebRequest \
        -Uri "https://github.com/traefik/traefik/releases/download/v3.5.0/traefik_v3.5.0_windows_amd64.zip" \
        -OutFile "/traefik.zip"; \
    Expand-Archive -Path "/traefik.zip" -DestinationPath "/" -Force; \
    Remove-Item "/traefik.zip" -Force

EXPOSE 80
ENTRYPOINT [ "/traefik" ]

# Metadata
LABEL org.opencontainers.image.vendor="Traefik Labs" \
    org.opencontainers.image.url="https://traefik.io" \
    org.opencontainers.image.source="https://github.com/traefik/traefik" \
    org.opencontainers.image.title="Traefik" \
    org.opencontainers.image.description="A modern reverse-proxy" \
    org.opencontainers.image.version="v3.5.0" \
    org.opencontainers.image.documentation="https://docs.traefik.io"
