provider "aws" {
  region = "us-east-1"
  access_key = "AKIASYCL2FWCWX24TB4A"
  secret_key = "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"
}

resource "aws_instance" "myec2" {
  ami           = "ami-0323c3dd2da7fb37d"
  instance_type = "t2.micro"
}