package config

import (
    "github.com/zeromicro/go-zero/zrpc"
    "github.com/zeromicro/zero-contrib/zrpc/registry/consul"
)

type Config struct {
	zrpc.RpcServerConf
	Consul consul.Conf
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
