package svc

import (
	{{.configImport}}

	"github.com/go-redis/redis/v8"
    "go.mongodb.org/mongo-driver/mongo"
    "github.com/neccoys/go-driver/mongox"
    "strings"
)

type ServiceContext struct {
	Config {{.config}}
	RedisClient  *redis.Client
	BoDB         *mongo.Client
	{{.middleware}}
}

func NewServiceContext(c {{.config}}) *ServiceContext {
	// Redis
	redisClient := redis.NewFailoverClient(&redis.FailoverOptions{
		MasterName:    c.RedisCache.RedisMasterName,
		SentinelAddrs: strings.Split(c.RedisCache.RedisSentinelNode, ";"),
		DB:            c.RedisCache.RedisDB,
	})

	// MongoDB
    db, err := mongox.New(c.Mongo.Host).
        SetReplicaSet(c.Mongo.ReplicaSet).
        SetPool(c.Mongo.PoolMin, c.Mongo.PoolMax, c.Mongo.ConnIdleTime).
        Connect()

	if err != nil {
		panic(err)
	}

	return &ServiceContext{
		Config:      c,
        RedisClient: redisClient,
        BoDB:        db,
		{{.middlewareAssignment}}
	}
}