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
  Database: ${MONGO_DATABASE}
  PoolMin: ${MONGO_POOL_MIN}
  PoolMax: ${MONGO_POOL_MAX}
  ConnIdleTime: ${MONGO_IDLE_TIME}

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