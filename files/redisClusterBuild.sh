#!/bin/bash

# wait for all nodes to be available
wait-for-it 10.0.0.3:6379
wait-for-it 10.0.0.4:6380
wait-for-it 10.0.0.5:6381
wait-for-it 10.0.0.6:6382
wait-for-it 10.0.0.7:6383
wait-for-it 10.0.0.8:6384

# set up the cluster and accept default config
yes yes | redis-cli --cluster create 10.0.0.3:6379 10.0.0.4:6380 10.0.0.5:6381 10.0.0.6:6382 10.0.0.7:6383 10.0.0.8:6384 --cluster-replicas 1

# wait for the gui to be available
wait-for-it 10.0.0.2:8001

# add cluster to gui
curl -H "Content-Type: application/json" -X POST -d '{"name": "redisCluster", "connectionType": "CLUSTER", "seedNodes": [{"host": "10.0.0.3", "port": 6379 }]}' http://10.0.0.2:8001/api/instance/
