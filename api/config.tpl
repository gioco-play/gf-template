package config

import (
    {{.authImport}}

    "github.com/gioco-play/kit-plus/tool/dbx"
)

type Config struct {
	rest.RestConf
	{{.auth}}
	{{.jwtTrans}}
    Consul struct {
        Target string
    }
    BoMongo dbx.BoMongoSetting
    RedisCache struct {
        RedisSentinelNode string
        RedisMasterName   string
        RedisDB           int
    }
    TxPool dbx.TxPool
}
