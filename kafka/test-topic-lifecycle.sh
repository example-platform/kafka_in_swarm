#!/bin/bash
CMD_ROOT="/vagrant"
TOPIC="$1"

${CMD_ROOT}/kafka/topic-create.sh "${TOPIC}"
${CMD_ROOT}/kafka/topic-produce.sh "${TOPIC}"
${CMD_ROOT}/kafka/topic-consume.sh "${TOPIC}"

