Name: ${APP_NAME}
ListenOn: ${APP_HOST}

Log:
  Mode: ${LOG_MODE}

Telemetry:
  Name: ${APP_NAME}
  Endpoint: ${TRACE_ENDPOINT}
  Sampler: 1.0
  Batcher: jaeger

Mongo:
  Host: ${MONGO_HOST}
  ReplicaSet: ${MONGO_REPLICASET}
  MinPoolSize: ${MONGO_MIN_POOL}
  MaxPoolSize: ${MONGO_MAX_POOL}
  MaxConnIdleTime: ${MONGO_IDLE_TIME}

RedisCache:
  RedisSentinelNode: ${REDIS_SENTINEL_NODE}
  RedisMasterName: ${REDIS_MASTER_NAME}
  RedisDB: ${REDIS_DB}

Consul:
  Host: ${CONSUL_HOST}
  Key: ${APP_NAME}
  Meta:
    Protocol: grpc
  Tag: ${APP_TAG}
  ttl: ${CONSUL_TTL}