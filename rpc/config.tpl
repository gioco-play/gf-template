package config

import (
    "github.com/zeromicro/go-zero/zrpc"
    "github.com/zeromicro/zero-contrib/zrpc/registry/consul"
    "github.com/gioco-play/kit-plus/tool/dbx"
)

type Config struct {
	zrpc.RpcServerConf
	Consul consul.Conf

    BoMongoPool dbx.BoMongoPool
    TxPool dbx.TxPool
}
