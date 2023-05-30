package respx

import (
    "context"
    "net/http"
    {{.ImportPackages}}

    "github.com/zeromicro/go-zero/core/logx"
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

    LogResponse(r.Context(), body, w.Header())

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

    LogResponse(r.Context(), body, w.Header())

    httpx.OkJson(w, body)
}

func LogResponse(ctx context.Context, resp any, headers map[string][]string, fields ...logx.LogField) {
	fields = append(fields,
		logx.LogField{
			Key:   "response",
			Value: resp,
		},
		logx.LogField{
			Key:   "header",
			Value: headers,
		},
	)
	logx.WithContext(ctx).Infow("response", fields...)
}