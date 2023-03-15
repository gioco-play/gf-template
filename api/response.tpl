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

func Success(w http.ResponseWriter, resp interface{}) {
	httpx.OkJson(w, &Body{
		Status: SUCCESS.Code,
		Msg:    SUCCESS.Message,
		Data:   resp,
	})
}

func SuccessWithoutData(w http.ResponseWriter) {
	httpx.OkJson(w, &Body{
		Status: SUCCESS.Code,
		Msg:    SUCCESS.Message,
	})
}

func Fail(w http.ResponseWriter, state *Resp) {
	httpx.OkJson(w, &Body{
		Status: state.Code,
		Msg:    state.Message,
	})
}

func FailWithError(w http.ResponseWriter, err error) {
	var body *Body

	if v, ok := err.(*errorx.Err); ok && v.Error() != "" {
		body.Status = v.GetStatus()
		body.Msg = v.Error()
	} else {
		body.Status = FAIL.Code
		body.Msg = err.Error()
	}

	httpx.OkJson(w, body)
}
