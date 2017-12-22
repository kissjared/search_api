#!/bin/bash
set -e

# set default env
AppBase=${TOMCAT_HOME}/webapps
ES_HOST=${ES_HOST:-es:9300}
KAFKA_HOST=${KAFKA_HOST:-kafka:9092}
REDIS_HOST=${REDIS_HOST:-redis}
REDIS_PORT=${REDIS_PORT:-6379}

# search env
search_base=${AppBase}/search
search_es_config=${search_base}/WEB-INF/classes/elasticsearch.properties
search_kafka_config=${search_base}/WEB-INF/classes/kafka.properties
search_redis_config=${search_base}/WEB-INF/classes/redis.properties
sed -i -E "s#ES_HOST#${ES_HOST}#g" $search_es_config
sed -i -E "s#KAFKA_HOST#${KAFKA_HOST}#g" $search_kafka_config
sed -i -E "s#REDIS_HOST#${REDIS_HOST}#g" $search_redis_config
sed -i -E "s#REDIS_PORT#${REDIS_PORT}#g" $search_redis_config

env
exec "$@"
