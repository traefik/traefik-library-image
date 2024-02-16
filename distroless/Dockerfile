# Base image with specified Traefik version
ARG VERSION="v3.0.0-rc1"
# Base image with specified Traefik version
FROM traefik:${VERSION} as base

# Final image based on Distroless for security and minimal size
FROM gcr.io/distroless/static-debian12

# Copy the Traefik binary from the base image
COPY --from=base /usr/local/bin/traefik /

# Set metadata using labels
LABEL org.opencontainers.image.vendor="Traefik Labs" \
      org.opencontainers.image.url="https://traefik.io" \
      org.opencontainers.image.title="Traefik" \
      org.opencontainers.image.description="A modern reverse-proxy" \
      org.opencontainers.image.version="${VERSION}" \
      org.opencontainers.image.documentation="https://docs.traefik.io"

# Use non-root user for better security
USER nonroot

# Expose default HTTP port
EXPOSE 80

# Define volume for temporary data
VOLUME ["/tmp"]

# Set entrypoint to run Traefik
ENTRYPOINT ["/traefik"]