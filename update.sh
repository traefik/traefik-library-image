#!/usr/bin/env bash

set -e
set -u # Exit on error when uninitialized variable
shopt -s extglob

if [ $# -eq 0 ] ; then
	echo "Usage: ./update.sh <traefik tag or branch>"
	exit
fi

export VERSION=$1
export ALPINE_VERSION=3.21
PLATFORMS=(
	"alpine"
	"scratch"
	"windows/1809"
	"windows/nanoserver-ltsc2022"
	"windows/servercore-ltsc2022"
)

SCRIPT_DIRNAME_ABSOLUTEPATH="$(cd "$(dirname "$0")" && pwd -P)"

# cd to the current directory so the script can be run from anywhere.
pushd "${SCRIPT_DIRNAME_ABSOLUTEPATH}"

for PLATFORM in "${PLATFORMS[@]}" ; do
	TEMPLATE_DIR="${SCRIPT_DIRNAME_ABSOLUTEPATH}/tmpl/${PLATFORM}"
	PLATFORM_DIR="${SCRIPT_DIRNAME_ABSOLUTEPATH}/${VERSION/%.+([0-9a-z\-])/}/${PLATFORM}"
	[ -d "${PLATFORM_DIR}" ] || (mkdir -p ${PLATFORM_DIR})

	echo "= Generating Dockerfile for platform ${PLATFORM}"

	rm -f "${PLATFORM_DIR}/Dockerfile"
    # the version of the template is determined by the 2 first chars of the Traefik version passed as argument to this script
	envsubst \$ALPINE_VERSION,\$VERSION < "${TEMPLATE_DIR}/tmpl${VERSION:0:2}.Dockerfile" > "${PLATFORM_DIR}/Dockerfile"

	if [ "${PLATFORM}" = "alpine" ]; then
		cp "${TEMPLATE_DIR}/entrypoint.sh" "${PLATFORM_DIR}/entrypoint.sh"
	fi
done

echo "= All Dockerfiles updated."
popd # Browse back to caller dirname
