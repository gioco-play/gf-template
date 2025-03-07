package svc

import (
	{{.configImport}}

	"github.com/redis/go-redis/v9"
	"github.com/gioco-play/kit-plus/tool/configx"
    "github.com/gioco-play/kit-plus/tool/dbx"
    "strings"
)

type ServiceContext struct {
	Config {{.config}}
	RedisClient  *redis.Client
	*dbx.Databasex
	{{.middleware}}
}

func NewServiceContext(c {{.config}}) *ServiceContext {
	cx := configx.NewConfigCenter(c.ConsulHost).Load()
    boMongoSetting := configx.Get[dbx.BoMongoSetting](cx, "bo_mongo")
    // BoMongo Pool
    boMongoSetting.BoMongoPool = &c.BoMongoPool

    // redis
    redisSetting := configx.Get[dbx.RedisSentinel](cx, "redis")
    redisClient := redisSetting.Connect()

	databasex := dbx.New(boMongoSetting).SetTxPool(c.TxPool)

	return &ServiceContext{
		Config:      c,
        RedisClient: redisClient,
        Databasex:   databasex,
		{{.middlewareAssignment}}
	}
}
