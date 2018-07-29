#!/bin/bash
CMD_ROOT="/vagrant"
docker stack deploy \
  --compose-file "${CMD_ROOT}/kafka/files/kafka-compose.yml" kfk

echo "Done: kafka stack"
