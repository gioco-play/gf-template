package config

import (
    "github.com/zeromicro/go-zero/zrpc"
    "github.com/zeromicro/zero-contrib/zrpc/registry/consul"
)

type Config struct {
	zrpc.RpcServerConf
	Consul consul.Conf
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
