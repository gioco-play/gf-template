package config

import {{.authImport}}
import {{.serviceImportStr}}

type Config struct {
	rest.RestConf
	{{.auth}}
	{{.jwtTrans}}
    service.ServiceConf
    Consul struct {
        Target string
    }
    Mongo struct {
        Host          string
        ReplicaSet    string
        PoolMin       uint64
        PoolMax       uint64
        ConnIdleTime  uint64
    }
    RedisCache struct {
        RedisSentinelNode string
        RedisMasterName   string
        RedisDB           int
    }
}
