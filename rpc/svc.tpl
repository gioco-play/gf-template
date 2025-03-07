package svc

import (
    {{.imports}}

    "github.com/redis/go-redis/v9"
    "github.com/gioco-play/kit-plus/tool/configx"
    "github.com/gioco-play/kit-plus/tool/dbx"
    "strings"
)

type ServiceContext struct {
	Config      config.Config
    RedisClient *redis.Client
    *dbx.Databasex
}

func NewServiceContext(c config.Config) *ServiceContext {
	cx := configx.NewConfigCenter(c.Consul.Host).Load()
    boMongoSetting := configx.Get[dbx.BoMongoSetting](cx, "bo_mongo")
    // BoMongo Pool
    boMongoSetting.BoMongoPool = &c.BoMongoPool

    // redis
    redisSetting := configx.Get[dbx.RedisSentinel](cx, "redis")
    redisCache := redisSetting.Connect()

	databasex := dbx.New(boMongoSetting).SetTxPool(c.TxPool)

	return &ServiceContext{
		Config:      c,
        RedisClient: redisClient,
        Databasex:   databasex,
	}
}
