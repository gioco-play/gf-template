APP_NAME={{.serviceName}}.rpc
APP_HOST={{.host}}
APP_TAG=["{{.serviceName}}"]

MONGO_HOST=192.168.30.41:27017,192.168.30.42:27017,192.168.30.43:27017
MONGO_REPLICASET=beta-db
MONGO_MIN_POOL=1
MONGO_MAX_POOL=10
MONGO_IDLE_TIME=180

CONSUL_HOST=192.168.10.93:8500
CONSUL_TTL=20

TRACE_ENDPOINT=http://172.16.204.124:14268/api/traces

LOG_MODE=console

REDIS_SENTINEL_NODE=192.168.30.38:26379;192.168.30.39:26379;192.168.30.40:26379
REDIS_MASTER_NAME=mymaster
REDIS_DB=1
REDIS_PREFIX=gps::