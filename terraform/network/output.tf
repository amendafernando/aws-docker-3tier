output "vpc_id" {
  value = aws_vpc.vpc
}

output "subnet_id" {
  value = aws_subnet.public_subnet_1
}

output "security_group_id" {
  value = aws_security_group.allow_web.id
}