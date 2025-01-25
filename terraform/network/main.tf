resource "aws_default_vpc" "default" {
  tags = {
    Name = "WebApp VPC"
  }
}

resource "aws_default_subnet" "default_az1" {
  availability_zone = "${var.aws_region}a"
  tags = {
    Name = "WebApp subnet"
  }
}

resource "aws_security_group" "allow_web" {
  name        = "${var.project_name}-allow-web"
  description = "Allow web traffic"
  vpc_id      = aws_default_vpc.default.id

  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
