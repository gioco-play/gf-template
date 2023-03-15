package respx

import (
    "net/http"

    "github.com/zeromicro/go-zero/rest/httpx"
)

type Body struct {
    Status int         `json:"status"`
    Msg  string      `json:"msg"`
    Data interface{} `json:"data,omitempty"`
}

func Response(w http.ResponseWriter, status int, resp interface{}, err error) {
    var body Body

     body.Status = status

    if err != nil {
        body.Msg = err.Error()
    } else {
        body.Msg = "Success"
        body.Data = resp
    }

    httpx.OkJson(w, body)
}