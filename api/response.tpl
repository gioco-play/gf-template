package respx

import (
    "context"
    "net/http"
    {{.ImportPackages}}

    "github.com/zeromicro/go-zero/core/logx"
    "github.com/zeromicro/go-zero/rest/httpx"
    "go.opentelemetry.io/otel/trace"
)

type Body struct {
    Status int         `json:"status"`
    Msg    string      `json:"msg"`
    Data   interface{} `json:"data,omitempty"`
    Trace  string      `json:"trace,omitempty"`
}

func Success(w http.ResponseWriter, r *http.Request, resp interface{}) {
    body := &Body{
        Status: SUCCESS.Status,
        Msg:    SUCCESS.Message,
        Data:   resp,
    }

    ctx := r.Context()
    LogResponse(ctx, body, w.Header())

    span := trace.SpanFromContext(ctx)
    body.Trace = span.SpanContext().TraceID().String()

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

    ctx := r.Context()
    LogResponse(ctx, body, w.Header())

    span := trace.SpanFromContext(ctx)
    body.Trace = span.SpanContext().TraceID().String()

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