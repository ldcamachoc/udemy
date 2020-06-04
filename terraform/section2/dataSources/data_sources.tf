provider "aws" {
  region     = "ca-central-1"
  version    = "2.7"
  access_key = "AKIASYCL2FWCWX24TB4A"
  secret_key = "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"
}

data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "instance-1" {
  ami           = data.aws_ami.app_ami.id
  instance_type = "t2.micro"
}