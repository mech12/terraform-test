variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  # default     = 8080
}

# 리눅스 환경변수 정의방법
# export TF_VAR_server_port=8080

# 리눅스 환경변수 삭제 방법
# unset <환경변수 이름>

# 실행시 지정
# terraform plan -var "server_port=8081"

