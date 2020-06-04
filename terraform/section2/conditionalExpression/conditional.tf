provider "aws" {
  region = "us-east-1"
  version = "2.7"
  access_key = "AKIASYCL2FWCWX24TB4A"
  secret_key = "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"
}

variable "isTest" {
  type = bool
}

resource "aws_instance" "dev" {
  ami = "ami-0323c3dd2da7fb37d"
  instance_type = "t2.micro"
  count = var.isTest == true ? 1 : 0
}

resource "aws_instance" "prod" {
  ami = "ami-0323c3dd2da7fb37d"
  instance_type = "t2.large"
  count = var.isTest == false ? 1 : 0
}