#!/bin/bash
KAFKA_IMAGE=exampleplatform/kafka:latest
KAFKA_BIN="kafka/bin"
ZOO_EXT="10.0.0.12:2181"
TOPIC="$1"
CONTAINER_NAME="kafka-worker"

echo "Create topic '${TOPIC}'"
docker run --rm --name ${CONTAINER_NAME} ${KAFKA_IMAGE} "${KAFKA_BIN}/kafka-topics.sh" \
    --zookeeper "${ZOO_EXT}" \
    --create \
    --replication-factor 1 \
    --partitions 1 \
    --topic "${TOPIC}"