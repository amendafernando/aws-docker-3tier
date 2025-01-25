resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = data.terraform_remote_state.remote_data.outputs.subnet_id
  vpc_security_group_ids = [data.terraform_remote_state.remote_data.outputs.security_group_id]
 
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


# data.terraform_remote_state.remote_data.outputs.security_group_id