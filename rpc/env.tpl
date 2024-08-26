APP_NAME={{.serviceName}}.rpc
APP_HOST={{.host}}
APP_TAG=["{{.serviceName}}"]
TIMEOUT=5000
MODE=dev

MONGO_HOST=172.16.204.211:27017,172.16.204.212:27017,172.16.204.213:27017
MONGO_REPLICASET=
MONGO_MIN_POOL=1
MONGO_MAX_POOL=10
MONGO_IDLE_TIME=180

POSTGRES_MIN_POOL=1
POSTGRES_MAX_POOL=10
POSTGRES_IDLE_TIME=180

CONSUL_HOST=172.16.204.145:8500
CONSUL_TTL=20

TRACE_ENDPOINT=http://172.16.204.124:14268/api/traces

LOG_MODE=console
LOG_STAT=false

REDIS_SENTINEL_NODE=172.16.204.208:26379;172.16.204.209:26379;172.16.204.210:26379
REDIS_MASTER_NAME=mymaster
REDIS_DB=7