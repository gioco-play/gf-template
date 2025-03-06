Name: ${APP_NAME}
Host: ${APP_HOST}
Port: ${APP_PORT}
Timeout: ${TIMEOUT}
Mode: ${MODE}

ConsulHost: ${CONSUL_HOST}

Log:
  Mode: ${LOG_MODE}
  Stat: ${LOG_STAT}

Telemetry:
  Name: ${APP_NAME}
  Endpoint: ${TRACE_ENDPOINT}
  Sampler: 1.0
  Batcher: jaeger

BoMongoPool:
  MinPoolSize: ${MONGO_MIN_POOL}
  MaxPoolSize: ${MONGO_MAX_POOL}
  MaxConnIdleTime: ${MONGO_IDLE_TIME}

TxPool:
  MinPoolSize: ${POSTGRES_MIN_POOL}
  MaxPoolSize: ${POSTGRES_MAX_POOL}
  MaxConnIdleTime: ${POSTGRES_IDLE_TIME}

Prometheus:
  Host: ${PROMETHEUS_HOST}
  Port: ${PROMETHEUS_PORT}
  Path: ${PROMETHEUS_PATH}