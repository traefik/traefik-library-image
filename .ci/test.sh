#!/usr/bin/env bash

set -Eeuo pipefail
# set -x
shopt -s extglob

VERSION=$(cat version)

API_OPTS=""
if [[ ${VERSION} = v2* ]]; then
    API_OPTS="--api.insecure"
fi
if [[ ${VERSION} = v3* ]]; then
    API_OPTS="--api.insecure"
fi

TARGETS=(
    "traefik:${VERSION}-alpine!./${VERSION/%.+([0-9])/}/alpine"
    "traefik:${VERSION}!./${VERSION/%.+([0-9])/}/scratch"
)

for target in ${TARGETS[@]}; do
    image="${target%%!*}"
    path="${target##*!}"
    echo "#### Testing image: ${image}"

    docker build -t "${image}" "${path}"
    # Docker Official Library Tests
    ~/official-images/test/run.sh "$image"
    # Smoke Test of the image
    docker run --name lb -d -p 8080:8080 "${image}" --api "${API_OPTS}"
    sleep 2
    docker ps
    curl --verbose --fail http://localhost:8080
    docker rm -f lb
done
