resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = merge(var.default_tags, { Name = "${var.prefix}-vpc" })
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.public_subnet_cidrs[0]
  availability_zone = "us-east-1a"

  tags = merge(var.default_tags, { Name = "${var.prefix}-public-subnet-1" })
}

resource "aws_route_table_association" "public_association_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public.id
}


resource "aws_internet_gateway" "igw" {
  vpc_id = module.vpc.vpc_id
  tags   = merge(var.default_tags, { Name = "${var.prefix}-igw" })
}

resource "aws_route_table" "public" {
  vpc_id = module.vpc.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = merge(var.default_tags, { Name = "${var.prefix}-public-rt" })
}

resource "aws_security_group" "allow_web" {
  name        = "${var.prefix}-allow-web"
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
