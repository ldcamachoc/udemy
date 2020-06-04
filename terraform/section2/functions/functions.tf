provider "aws" {
  region = var.region
  version = "2.7"
  access_key = "AKIASYCL2FWCWX24TB4A"
  secret_key = "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"
}

locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

variable "region" {
  default = "us-east-1"
}

variable "tags" {
  type = list(string)
  default = ["firstec2","secondec2"]
}

variable "ami" {
  type = map
  default = {
    "us-east-1" = "ami-0323c3dd2da7fb37d"
    "us-west-2" = "ami-0d6621c01e8c2de2c"
    "ap-south-1" = "ami-0470e33cd681b2476"
  }
}

resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}


resource "aws_key_pair" "loginkey" {
  key_name = "login-key"
  public_key = tls_private_key.example.public_key_openssh
}

resource "aws_instance" "app-dev" {
  ami = lookup(var.ami, var.region)
  instance_type = "t2.micro"
  key_name = aws_key_pair.loginkey.key_name
  count = 2

  tags = {
    name = element(var.tags, count.index)
  }
}

output "timestamp" {
  value = local.time
}