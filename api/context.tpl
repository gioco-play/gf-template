package svc

import (
	{{.configImport}}

	"github.com/go-redis/redis/v8"
    "github.com/gioco-play/kit-plus/tool/dbx"
    "github.com/neccoys/go-driver/mongox"
    "strings"
)

type ServiceContext struct {
	Config {{.config}}
	RedisClient  *redis.Client
	*dbx.Databasex
	{{.middleware}}
}

func NewServiceContext(c {{.config}}) *ServiceContext {
	// Redis
	redisClient := redis.NewFailoverClient(&redis.FailoverOptions{
		MasterName:    c.RedisCache.RedisMasterName,
		SentinelAddrs: strings.Split(c.RedisCache.RedisSentinelNode, ";"),
		DB:            c.RedisCache.RedisDB,
	})

	databasex := dbx.New(c.BoMongo).SetTxPool(c.TxPool)

	return &ServiceContext{
		Config:      c,
        RedisClient: redisClient,
        Databasex:   databasex,
		{{.middlewareAssignment}}
	}
}
