APP_NAME={{.serviceName}}
APP_MODE=debug
APP_HOST={{.host}}
APP_PORT={{.port}}
TIMEOUT=20000
LOG_MODE=console
LOG_STAT=false

MONGO_HOST=172.16.204.216:27017,172.16.204.217:27017,172.16.204.218:27017
MONGO_REPLICASET=gfv3-db
MONGO_MIN_POOL=1
MONGO_MAX_POOL=10
MONGO_IDLE_TIME=180

REDIS_SENTINEL_NODE=192.168.30.38:26379;192.168.30.39:26379;192.168.30.40:26379
REDIS_MASTER_NAME=mymaster
REDIS_DB=7

CONSUL_HOST=172.16.204.145:8500
CONSUL_TTL=20

TRACE_ENDPOINT=http://172.16.204.145:14268/api/traces

POSTGRES_MIN_POOL=1
POSTGRES_MAX_POOL=10
POSTGRES_IDLE_TIME=180

PROMETHEUS_HOST=0.0.0.0
PROMETHEUS_PORT=9091
PROMETHEUS_PATH=/metrics