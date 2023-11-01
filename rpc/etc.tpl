Name: ${APP_NAME}
ListenOn: ${APP_HOST}
Timeout: ${TIMEOUT}
ServiceEnv: ${SERVICE_ENV}

Log:
  Mode: ${LOG_MODE}
  Stat: ${LOG_STAT}

Telemetry:
  Name: ${APP_NAME}
  Endpoint: ${TRACE_ENDPOINT}
  Sampler: 1.0
  Batcher: jaeger

BoMongo:
  Host: ${MONGO_HOST}
  ReplicaSet: ${MONGO_REPLICASET}
  MinPoolSize: ${MONGO_MIN_POOL}
  MaxPoolSize: ${MONGO_MAX_POOL}
  MaxConnIdleTime: ${MONGO_IDLE_TIME}

RedisCache:
  RedisSentinelNode: ${REDIS_SENTINEL_NODE}
  RedisMasterName: ${REDIS_MASTER_NAME}
  RedisDB: ${REDIS_DB}

TxPool:
  MinPoolSize: ${POSTGRES_MIN_POOL}
  MaxPoolSize: ${POSTGRES_MAX_POOL}
  MaxConnIdleTime: ${POSTGRES_IDLE_TIME}

Consul:
  Host: ${CONSUL_HOST}
  Key: ${APP_NAME}
  Meta:
    Protocol: grpc
  Tag: ${APP_TAG}
  ttl: ${CONSUL_TTL}