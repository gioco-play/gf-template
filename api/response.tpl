package respx

import (
    "net/http"
    {{.ImportPackages}}

    "github.com/zeromicro/go-zero/rest/httpx"
)

type Body struct {
    Status int         `json:"status"`
    Msg    string      `json:"msg"`
    Data   interface{} `json:"data,omitempty"`
}

func Success(w http.ResponseWriter, r *http.Request, resp interface{}) {
    body := &Body{
        Status: SUCCESS.Status,
        Msg:    SUCCESS.Message,
        Data:   resp,
    }

    httpx.OkJson(w, body)
}

func Fail(w http.ResponseWriter, r *http.Request, err error) {
    var body Body

    if v, ok := err.(*errorx.Err); ok && v.Error() != "" {
        body.Status = v.GetStatus()
        body.Msg = v.Error()
    } else {
        body.Status = FAIL.Status
        body.Msg = err.Error()
    }

    httpx.OkJson(w, body)
}