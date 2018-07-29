#!/bin/bash
KAFKA_IMAGE=exampleplatform/kafka:latest
KAFKA_BIN="kafka/bin"
ZOO_EXT="10.0.0.12:2181"
TOPIC="$1"
CONTAINER_NAME="kafka-worker"
docker run --rm --name ${CONTAINER_NAME} ${KAFKA_IMAGE} "${KAFKA_BIN}/kafka-topics.sh" \
           --list --topic "${TOPIC}" --zookeeper "${ZOO_EXT}"

echo "Done listing"
