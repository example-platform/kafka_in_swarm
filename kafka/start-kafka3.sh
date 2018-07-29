#!/bin/bash
KAFKA_IMAGE=exampleplatform/kafka:latest
docker service create \
    --name kafka3 \
    --mount type=volume,source=k3-logs,destination=/tmp/kafka-logs \
    --publish 9095:9095 \
    --network kafka-net \
    --mode global \
    --constraint node.labels.kafka==3 \
    ${KAFKA_IMAGE} \
    /kafka/bin/kafka-server-start.sh /kafka/config/server.properties \
    --override listeners=INT://:9092,EXT://0.0.0.0:9095 \
    --override listener.security.protocol.map=INT:PLAINTEXT,EXT:PLAINTEXT \
    --override inter.broker.listener.name=INT \
    --override advertised.listeners=INT://:9092,EXT://10.0.0.14:9095 \
    --override zookeeper.connect=zookeeper:2181 \
    --override broker.id=3