variable "region" {
  default     = "ap-northeast-2"
  description = "AWS 리전"
}

provider "aws" {
  region = var.region
}
# data source는 수정은 불가능하고 오직 참조만 가능
# AWS Availability zone에 접근해서 조회
## https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones
data "aws_availability_zones" "available" {}

# locals는 모듈 내에서 사용할 수 있는 값
## local ? input ? output?
### https://kim-dragon.tistory.com/219
locals {
  cluster_name = "education-eks-${random_string.suffix.result}"
}

resource "random_string" "suffix" {
  length  = 8
  special = false // 랜덤 문제에 특수 문자를 포함할지 여부
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws" # 사용할 모듈 지정
  version = "3.2.0"

  name                 = "education-vpc"
  cidr                 = "10.0.0.0/16"
  azs                  = data.aws_availability_zones.available.names # 가용영역 지정
  private_subnets      = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets       = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
  }
}