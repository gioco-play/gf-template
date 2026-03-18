package middleware

import (
    "net/http"
	"github.com/redis/go-redis/v9"
	"github.com/gioco-play/kit-plus/tool/dbx"
)

type {{.name}} struct {
	RedisClient *redis.Client
	Databasex	*dbx.Databasex
}

func New{{.name}}(redisClient *redis.Client, dbx *dbx.Databasex) *{{.name}} {
	return &{{.name}}{
        RedisClient: redisClient,
        Databasex:   dbx,
    }
}

func (m *{{.name}})Handle(next http.HandlerFunc) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
        //// 驗證是否為 application/json
        // ctHdr := r.Header.Get("Content-Type")
        // contentType, _, err := mime.ParseMediaType(ctHdr)
        // if  err != nil || contentType != "application/json" {
        //     respx.Fail(w, r, respx.INCORRECT_DATA_FIELD)
        //     return
        // }
        // // 讀取Body後
        // bodyBytes, _ := io.ReadAll(r.Body)
        // r.Body.Close()
        // r.Body = io.NopCloser(bytes.NewBuffer(bodyBytes))
		// // TODO generate middleware implement function, delete after code implementation
		// log.Println(bodyBytes)
		// var auth form.MerchantAuth
		// err = json.Unmarshal(bodyBytes, &auth)
		// Passthrough to next handler if need
		next(w, r)
	}
}
