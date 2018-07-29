#!/bin/bash
KAFKA_IMAGE=exampleplatform/kafka:latest
docker service create \
    --name kafka2 \
    --mount type=volume,source=k2-logs,destination=/tmp/kafka-logs \
    --publish 9094:9094 \
    --network kafka-net \
    --mode global \
    --constraint node.labels.kafka==2 \
    ${KAFKA_IMAGE} \
    /kafka/bin/kafka-server-start.sh /kafka/config/server.properties \
    --override listeners=INT://:9092,EXT://0.0.0.0:9094 \
    --override listener.security.protocol.map=INT:PLAINTEXT,EXT:PLAINTEXT \
    --override inter.broker.listener.name=INT \
    --override advertised.listeners=INT://:9092,EXT://10.0.0.13:9094 \
    --override zookeeper.connect=zookeeper:2181 \
    --override broker.id=2