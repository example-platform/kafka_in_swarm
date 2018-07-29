#!/bin/bash
DOCKER_TAR="example-kafka.tar"
QUIET_OUT="/dev/null"
CMD_ROOT="/vagrant"
DOCKER_IMAGE="exampleplatform/kafka:latest"
docker pull ${DOCKER_IMAGE} &> ${QUIET_OUT}
docker save --output "${CMD_ROOT}/kafka/${DOCKER_TAR}" ${DOCKER_IMAGE}
