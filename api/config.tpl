package config

import (
    {{.authImport}}

    "github.com/gioco-play/kit-plus/tool/dbx"
)

type Config struct {
	rest.RestConf
	{{.auth}}
	{{.jwtTrans}}

    ConsulHost string
    BoMongoPool dbx.BoMongoPool
    TxPool dbx.TxPool
}
