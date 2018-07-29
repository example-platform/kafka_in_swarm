#!/bin/bash
docker node update --label-add zoo=1 dock-node-002
docker node update --label-add kafka=1 dock-node-002
docker node update --label-add kafka=2 dock-node-003
docker node update --label-add kafka=3 dock-node-004