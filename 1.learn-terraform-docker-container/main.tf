terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider  "docker" {}

# 리소스는 하나 이상의 인프라스트럭처 객체를 표현
# 지정된 로컬 이름("nginx")을 사용하여 지정된 유형("docker_image")의 리소스를 선언
# 이름은 동일한 Terraform 모듈에서 이 리소스를 참조하는 데 사용되지만, 해당 모듈의 범위를 벗어나는 의미는 없습니다.
resource "docker_image" "nginx" {
  name = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "tutorial"
  ports {
    internal = 80
    external = 8000
  }
}