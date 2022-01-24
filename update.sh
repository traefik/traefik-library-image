#!/usr/bin/env bash

set -e
set -u # Exit on error when uninitialized variable

if [ $# -eq 0 ] ; then
	echo "Usage: ./update.sh <traefik tag or branch>"
	exit
fi

export VERSION=$1
export ALPINE_VERSION=3.14
PLATFORMS=(
	"alpine"
	"alpine-k8s"
	"scratch"
	"windows/1809"
)

SCRIPT_DIRNAME_ABSOLUTEPATH="$(cd "$(dirname "$0")" && pwd -P)"

# cd to the current directory so the script can be run from anywhere.
pushd "${SCRIPT_DIRNAME_ABSOLUTEPATH}"

for PLATFORM in "${PLATFORMS[@]}" ; do
	PLATFORM_DIR="${SCRIPT_DIRNAME_ABSOLUTEPATH}/${PLATFORM}"
	[ -d "${PLATFORM_DIR}" ] || ( echo "= No directory found for ${PLATFORM_DIR}" && exit 1)

	echo "= Generating Dockerfile for platform ${PLATFORM}"

	rm -f "${PLATFORM_DIR}/Dockerfile"
    # the version of the template is determined by the 2 first chars of the Traefik version passed as argument to this script
	envsubst \$ALPINE_VERSION,\$VERSION < "${PLATFORM_DIR}/tmpl${VERSION:0:2}.Dockerfile" > "${PLATFORM_DIR}/Dockerfile"

done

echo "= All Dockerfiles updated."
popd # Browse back to caller dirname
