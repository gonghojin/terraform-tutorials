terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

# aws provider 사용
# aws provider의 설정은 다음 순서로 적용됨
##  provider의 구성에 적용된 파라미터 > 환경설정 변수 > credentials files > configuration files > ...
### https://registry.terraform.io/providers/hashicorp/aws/latest/docs
provider "aws" {
  profile = "default"
  region  = "ap-northeast-2"
}

# 리소스의 "타입", "이름"
resource "aws_instance" "app_server" {
  ami           = "ami-033a6a056910d1137"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
