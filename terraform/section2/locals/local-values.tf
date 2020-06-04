provider "aws" {
  region = "us-east-1"
  version = "2.7"
  access_key = "AKIASYCL2FWCWX24TB4A"
  secret_key = "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"
}

locals {
  common_tags = {
    Owner = "Devops Team"
    service = "backend"
  }
}

resource "aws_instance" "app-dev" {
  ami = "ami-0323c3dd2da7fb37d"
  instance_type = "t2.micro"
  tags = local.common_tags
}

resource "aws_instance" "db-dev" {
  ami = "ami-0323c3dd2da7fb37d"
  instance_type = "t2.small"
  tags = local.common_tags
}

resource "aws_ebs_volume" "db_ebs" {
  availability_zone = "us-east-1"
  size = 8
  tags = local.common_tags
}