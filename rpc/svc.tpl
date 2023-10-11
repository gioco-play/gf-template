package svc

import (
    {{.imports}}

    "github.com/go-redis/redis/v8"
    "github.com/gioco-play/kit-plus/tool/dbx"
    "github.com/neccoys/go-driver/mongox"
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

	// BoMongoDB
    db, err := mongox.New(c.Mongo.Host).
		SetReplicaSet(c.Mongo.ReplicaSet).
		SetPool(c.Mongo.MinPoolSize, c.Mongo.MaxPoolSize, c.Mongo.MaxConnIdleTime).
		Connect()

	if err != nil {
		panic(err)
	}

	return &ServiceContext{
		Config:      c,
        RedisClient: redisClient,
        Databasex:   dbx.New(db).SetTxPool(c.TxPool),
	}
}
