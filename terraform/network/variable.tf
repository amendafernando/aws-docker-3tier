variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "ingress_ports" {
  description = "List of ingress ports"
  type        = list(number)
  default     = [22, 8081, 8082, 8083]
}