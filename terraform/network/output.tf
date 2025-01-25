output "vpc_id" {
  value = aws_default_vpc.default.id
}

output "subnet_id" {
  value = aws_default_subnet.default_az1.id
}

output "security_group_id" {
  value = aws_security_group.allow_web.id
}