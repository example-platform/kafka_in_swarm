#!/bin/bash
CMD_ROOT="/vagrant"
docker stack deploy \
  --compose-file "${CMD_ROOT}/kafka/files/zookeeper-compose.yml" kfk

echo "Done: zookeeper stack"
