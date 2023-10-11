package config

import (
    "github.com/zeromicro/go-zero/zrpc"
    "github.com/zeromicro/zero-contrib/zrpc/registry/consul"
    "github.com/gioco-play/kit-plus/tool/dbx"
)

type Config struct {
	zrpc.RpcServerConf
	Consul consul.Conf
    BoMongo dbx.BoMongoSetting
    RedisCache struct {
        RedisSentinelNode string
        RedisMasterName   string
        RedisDB           int
    }
    TxPool dbx.TxPool
}
