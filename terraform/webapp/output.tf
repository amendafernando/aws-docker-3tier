output "ec2_public_ip" {
  description = "Public IP of EC2 instance"
  value       = aws_instance.app_server.public_ip
}

output "webapp_repository_url" {
  description = "URL of webapp ECR repository"
  value       = aws_ecr_repository.webapp.repository_url
}

output "mysql_repository_url" {
  description = "URL of MySQL ECR repository"
  value       = aws_ecr_repository.mysql.repository_url
}