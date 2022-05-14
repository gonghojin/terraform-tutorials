## Nginx 도커 컨네이너에 올리기

1. 도커와 상호작용하기 위한 플러그인을 설치
~~~
$ terraform init
~~~

2. apply를 사용하여 NGINX 서버 컨테이너를 프로비저닝합니다.   
   Terraform에서 확인을 요청하면 yes를 입력하고 Enter 키

~~~
terraform apply
~~~

자세한 내용 : https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started