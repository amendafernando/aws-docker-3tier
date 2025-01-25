variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1a"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "docker-ecr"
}

variable "project_name" {
  description = "Project name"
  type        = string
}


## free tier
variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
  default     = "ami-0ac4dfaf1c5c0cce9"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

# variable "subnet_id" {
#   description = "Subnet ID"
#   type        = string
# }

# variable "security_group_id" {
#   description = "Security group ID"
#   type        = string
# }
