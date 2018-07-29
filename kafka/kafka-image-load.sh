#!/bin/bash
DOCKER_TAR="example-kafka.tar"
QUIET_OUT="/dev/null"
CMD_ROOT="/vagrant"
docker load --input "${CMD_ROOT}/kafka/${DOCKER_TAR}" &> ${QUIET_OUT}
