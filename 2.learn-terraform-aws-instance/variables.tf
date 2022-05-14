# variables를 사용함으로써 유연하고 더 쉽게 재사용할 수 있는 환경설정을 가능하게 함
# 테라폼은 현재 디렉토리의 .tf 확장자를 가진 모든 파일을 load하기 때문에, 원하는 명칭으로 환경설정 파일을 생성 가능
variable "instance_name" {
  description = "EC2 인스턴스의 name tag 값"
  type        = string
  default     = "ExampleAppServerInstance"
}

// 튜토피얼 : https://learn.hashicorp.com/tutorials/terraform/aws-variables?in=terraform/aws-get-started