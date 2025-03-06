Name: ${APP_NAME}
ListenOn: ${APP_HOST}
Timeout: ${TIMEOUT}
Mode: ${MODE}

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

Consul:
  Host: ${CONSUL_HOST}
  Key: ${APP_NAME}
  Meta:
    Protocol: grpc
  Tag: ${APP_TAG}
  ttl: ${CONSUL_TTL}