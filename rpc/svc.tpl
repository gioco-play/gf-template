package svc

import (
    {{.imports}}

    "github.com/go-redis/redis/v8"
    "github.com/gioco-play/kit-plus/tool/dbx"
    "strings"
)

type ServiceContext struct {
	Config      config.Config
    RedisClient *redis.Client
    *dbx.Databasex
}

func NewServiceContext(c config.Config) *ServiceContext {
	// Redis
	redisClient := redis.NewFailoverClient(&redis.FailoverOptions{
		MasterName:    c.RedisCache.RedisMasterName,
		SentinelAddrs: strings.Split(c.RedisCache.RedisSentinelNode, ";"),
		DB:            c.RedisCache.RedisDB,
	})

	datebasex := dbx.New(c.BoMongo).SetTxPool(c.TxPool)

	return &ServiceContext{
		Config:      c,
        RedisClient: redisClient,
        Databasex:   datebasex,
	}
}
