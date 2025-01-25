provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "docker-amenda"
    key    = "webapp/terraform.tfstate"
    region = "us-east-1"
  }
}


