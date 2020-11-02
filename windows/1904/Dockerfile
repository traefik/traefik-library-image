FROM mcr.microsoft.com/windows/servercore:1904

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN $downloadUri = "\"https://github.com/traefik/traefik/releases/download/v2.3.2/traefik_v2.3.2_windows_amd64.zip\""; \
    Invoke-WebRequest -Uri $downloadUri -OutFile 'traefik.zip'; \
    Expand-Archive -Path "/traefik.zip" -DestinationPath "/" -Force; \
    Remove-Item traefik.zip

EXPOSE 80
ENTRYPOINT [ "/traefik" ]

# Metadata
LABEL org.opencontainers.image.vendor="Traefik Labs" \
    org.opencontainers.image.url="https://traefik.io" \
    org.opencontainers.image.title="Traefik" \
    org.opencontainers.image.description="A modern reverse-proxy" \
    org.opencontainers.image.version="v2.3.2" \
    org.opencontainers.image.documentation="https://docs.traefik.io"