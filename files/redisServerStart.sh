#!/bin/bash

envsubst < /data/default_redis.conf > /data/redis.conf
redis-server /data/redis.conf
