package {{.PkgName}}

import (
	"net/http"
	{{.ImportPackages}}

    "github.com/zeromicro/go-zero/core/logx"
	{{if .HasRequest}}"github.com/zeromicro/go-zero/rest/httpx"{{end}}
)

func {{.HandlerName}}(svcCtx *svc.ServiceContext) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
	    ctx := r.Context()
		{{if .HasRequest}}var req types.{{.RequestType}}
		if err := httpx.Parse(r, &req); err != nil {
		    logx.Error("{{.HandlerName}} error:", err)
            respx.Fail(w, r, respx.INCORRECT_DATA_FIELD)
            return
        }

        if err := utils.MyValidator.Struct(req); err != nil {
            logx.Error("{{.HandlerName}} error:", err)
            respx.Fail(w, r, respx.INCORRECT_DATA_FIELD)
            return
        }{{end}}

        utils.LogRequest(ctx, r, r.Header)

		l := {{.LogicName}}.New{{.LogicType}}(ctx, svcCtx)
		{{if .HasResp}}resp, {{end}}err := l.{{.Call}}({{if .HasRequest}}&req{{end}})
		if err != nil {
            respx.Fail(w, r, err)
        } else {
            {{if .HasResp}}respx.Success(w, r, resp){{else}}w.WriteHeader(http.StatusOK){{end}}
        }
	}
}
