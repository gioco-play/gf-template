// 擴充範本作為共用
package respx

{{.ImportPackages}}

var (
	FAIL                                        = &errorx.Err{Status: 9999, Message: "Fail"}
	SUCCESS                                     = &errorx.Err{Status: 1, Message: "Success"}                                        // 操作成功
	INCORRECT_DATA_FIELD                        = &errorx.Err{Status: 2, Message: "Incorrect data field"}                           // 资料栏位有误
	DATA_DOES_NOT_EXIST                         = &errorx.Err{Status: 4, Message: "Data does not exist"}                            // 资料不存在
	OPERATOR_DOES_NOT_EXIST_OR_THE_KEY_IS_WRONG = &errorx.Err{Status: 6000, Message: "Operator does not exist or the key is wrong"} //商户不存在或密钥错误
	PLAYER_HAS_FROZEN                           = &errorx.Err{Status: 6004, Message: "Player has frozen"}
	PLAYER_HAS_BEEN_BLOCKED                     = &errorx.Err{Status: 6005, Message: "Player has been blocked"}
	PLAYER_ACCOUNT_DOES_NOT_EXIST               = &errorx.Err{Status: 6007, Message: "Player account does not exist"}
	PRODUCT_HAS_NOT_BEEN_CONFIGURED             = &errorx.Err{Status: 7100, Message: "Product has not been configured"}
	THE_GAME_FAILED_TO_START                    = &errorx.Err{Status: 7200, Message: "The game failed to start"}
	GAME_MAINTENANCE                            = &errorx.Err{Status: 7201, Message: "Game maintenance"}
	GAME_TERMINATED                             = &errorx.Err{Status: 7202, Message: "Game terminated"}
	GAME_IS_BLOCKED                             = &errorx.Err{Status: 7203, Message: "Game is blocked"}
	GAME_DOES_NOT_EXIST                         = &errorx.Err{Status: 7204, Message: "Game does not exist"}
	GAME_VENDOR_MAINTENANCE                     = &errorx.Err{Status: 7401, Message: "Game vendor maintenance"}
	GAME_VENDOR_TERMINATED                      = &errorx.Err{Status: 7402, Message: "Game vendor terminated"}
	OPERATOR_GAME_LAUNCH_SWITCH_OFF             = &errorx.Err{Status: 7403, Message: "Operator GameLaunch switch off"}
	REQUEST_METHOD_NOT_ALLOWED                  = &errorx.Err{Status: 9101, Message: "Request method not allowed"}
	RESQUEST_TOO_FREQUENCY                      = &errorx.Err{Status: 9102, Message: "Resquest too frequency"}
	IP_ACCESS_RESTRICTION                       = &errorx.Err{Status: 9201, Message: "IP access restriction"}
	BLOCK_LIST_IP_ACCESS_RESTRICTION            = &errorx.Err{Status: 9202, Message: "Block list IP access restriction"}
	IN_MAINTENANCE                              = &errorx.Err{Status: 9501, Message: "In maintenance"}
	TERMINATED                                  = &errorx.Err{Status: 9502, Message: "Terminated"}
	PLATFORM_GAME_UNDER_MAINTENANCE             = &errorx.Err{Status: 9503, Message: "Platform game under maintenance"}
	PLATFORM_OPERATORS_ARE_UNDER_MAINTENANCE    = &errorx.Err{Status: 9504, Message: "Platform operators are under maintenance"}
)
