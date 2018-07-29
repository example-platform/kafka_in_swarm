#!/bin/bash
KAFKA_IMAGE=exampleplatform/kafka:latest
docker build -f Dockerfile.kafka -t ${KAFKA_IMAGE} .
docker push ${KAFKA_IMAGE}