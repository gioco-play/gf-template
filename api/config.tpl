package config

import {{.authImport}}

type Config struct {
	rest.RestConf
	{{.auth}}
	{{.jwtTrans}}
    Consul struct {
        Target string
    }
    Mongo struct {
        Host            string
        ReplicaSet      string
        MinPoolSize     uint64
        MaxPoolSize     uint64
        MaxConnIdleTime uint64
    }
    RedisCache struct {
        RedisSentinelNode string
        RedisMasterName   string
        RedisDB           int
    }
}
