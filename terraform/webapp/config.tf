provider "aws" {
  region = "us-east-1"
}

data "terraform_remote_state" "dev" {
  backend = "s3"

  config = {
    bucket = "docker-amenda"
    key    = "network/terraform.tfstate"
    region = "us-east-1"
  }
}