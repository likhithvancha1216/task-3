#!/usr/bin/env bash
# run-gvm-docker.sh
# Usage: ./run-gvm-docker.sh
# Requirements: Docker installed and running

set -euo pipefail

IMAGE="securecompliance/gvm:latest"
CONTAINER_NAME="gvm"

echo "Checking Docker..."
if ! command -v docker >/dev/null 2>&1; then
  echo "Error: docker is not installed. Install Docker and try again." >&2
  exit 1
fi

echo "Pulling GVM image: ${IMAGE}"
docker pull "${IMAGE}"

echo "If a container named ${CONTAINER_NAME} already exists, it will be removed."
if docker ps -a --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
  echo "Removing existing container ${CONTAINER_NAME}..."
  docker rm -f "${CONTAINER_NAME}" || true
fi

echo "Starting GVM container (web UI on port 9392)..."
docker run -d --name "${CONTAINER_NAME}" -p 9392:9392 --restart unless-stopped "${IMAGE}"

echo "Container started."
echo "Wait ~2-5 minutes for initialization, then open: http://localhost:9392"
echo "To view container logs (which may include generated credentials):"
echo "  docker logs -f ${CONTAINER_NAME}"
