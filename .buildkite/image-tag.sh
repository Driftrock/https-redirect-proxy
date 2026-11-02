#!/bin/bash
set -euo pipefail

NGINX_VERSION=$(sed -n 's/^ARG NGINX_VERSION=//p' Dockerfile | tr -d '[:space:]')
REVISION=$(tr -d '[:space:]' < REVISION)

if [ -z "${NGINX_VERSION}" ] || [ -z "${REVISION}" ]; then
  echo "Could not read 'ARG NGINX_VERSION=' from Dockerfile or the REVISION file" >&2
  exit 1
fi

echo "${NGINX_VERSION}-${REVISION}"