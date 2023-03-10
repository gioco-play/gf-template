Name: ${APP_NAME}
Host: ${APP_HOST}
Port: ${APP_PORT}
Timeout: ${TIMEOUT}

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
  Target: ${CONSUL_HOST}

Prometheus:
  Host: ${PROMETHEUS_HOST}
  Port: ${PROMETHEUS_PORT}
  Path: ${PROMETHEUS_PATH}