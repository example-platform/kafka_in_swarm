#!/bin/bash
KAFKA_IMAGE=exampleplatform/kafka:latest
KAFKA_BIN="kafka/bin"
BROKER_EXT="10.0.0.12:9093"
TOPIC="$1"
CONTAINER_NAME="kafka-worker"

echo "Start consuming messages on '${TOPIC}'"
docker run --rm --name ${CONTAINER_NAME} ${KAFKA_IMAGE} \
    "${KAFKA_BIN}/kafka-console-consumer.sh" \
    --bootstrap-server "${BROKER_EXT}" \
    --topic "${TOPIC}" --from-beginning --max-messages 42

echo "Finished consuming messages on '${TOPIC}'"