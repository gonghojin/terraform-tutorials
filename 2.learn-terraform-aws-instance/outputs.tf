# output 사용은 테라폼 사용자에게 데이터를 조회해서 표시해준다.
# output 사용하여 테라폼 프로젝트를 인프라의 다른 부분 또는 다른 테라폼 프로젝트와 연결할 수 있음
# 해당 링크 창조: https://learn.hashicorp.com/tutorials/terraform/outputs?in=terraform/configuration-language
output "instance_id" {
  description = "ID of the EC2 instance"
  value = aws_instance.app_server.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.app_server.public_ip
}