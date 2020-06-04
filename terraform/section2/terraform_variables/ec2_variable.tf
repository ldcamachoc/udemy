provider "aws" {
  region = "us-east-1"
  version = "2.7"
  access_key = "AKIASYCL2FWCU3XYOZ66"
  secret_key = "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"
}

resource "aws_instance" "myec2" {
  ami = "ami-0323c3dd2da7fb37d"
  instance_type = var.instancetype
}