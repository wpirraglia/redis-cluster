FROM redis:5.0.8
RUN apt-get update && apt-get install -y gettext wait-for-it
COPY files/default_redis.conf /data/default_redis.conf
COPY files/redisServerStart.sh /usr/local/bin/redisServerStart.sh
RUN chmod 700 /usr/local/bin/redisServerStart.sh
COPY files/redisClusterBuild.sh /usr/local/bin/redisClusterBuild.sh
RUN chmod 700 /usr/local/bin/redisClusterBuild.sh
CMD ["/usr/local/bin/redisServerStart.sh"]
