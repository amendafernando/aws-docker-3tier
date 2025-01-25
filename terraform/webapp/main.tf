resource "aws_ecr_repository" "webapp" {
  name = "${var.project_name}-webapp"
  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "mysql" {
  name = "${var.project_name}-mysql"
  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  iam_instance_profile = aws_iam_instance_profile.ec2_ecr_access.name
  
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y docker
              systemctl start docker
              systemctl enable docker
              EOF
  
  tags = {
    Name = "${var.project_name}-server"
    Environment = var.environment
  }
}

## ECR role


resource "aws_iam_role" "ec2_ecr_access" {
  name = "${var.project_name}-ec2-ecr-access"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ecr_policy" {
  role       = aws_iam_role.ec2_ecr_access.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_iam_instance_profile" "ec2_ecr_access" {
  name = "${var.project_name}-ec2-ecr-access"
  role = aws_iam_role.ec2_ecr_access.name
}
