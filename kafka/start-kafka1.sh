#!/bin/bash
KAFKA_IMAGE=exampleplatform/kafka:latest
docker service create \
    --name kafka1 \
    --mount type=volume,source=k1-logs,destination=/tmp/kafka-logs \
    --publish 9093:9093 \
    --network kafka-net \
    --mode global \
    --constraint node.labels.kafka==1 \
    ${KAFKA_IMAGE} \
    /kafka/bin/kafka-server-start.sh /kafka/config/server.properties \
    --override listeners=INT://:9092,EXT://0.0.0.0:9093 \
    --override listener.security.protocol.map=INT:PLAINTEXT,EXT:PLAINTEXT \
    --override inter.broker.listener.name=INT \
    --override advertised.listeners=INT://:9092,EXT://10.0.0.12:9093 \
    --override zookeeper.connect=zookeeper:2181 \
    --override broker.id=1