provider "aws" {
  region = "us-east-1"
  version = "2.7"
  access_key = "AKIASYCL2FWCU3XYOZ66"
  secret_key = "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"
}


resource "aws_security_group" "var_demo" {
  name = "kplabs-variables"

  ingress {
    from_port = 443
    protocol = "tcp"
    to_port = 443
    cidr_blocks = [var.vpn_ip]
  }

  ingress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = [var.vpn_ip]
  }

  ingress {
    from_port = 53
    protocol = "tcp"
    to_port = 53
    cidr_blocks = [var.vpn_ip]
  }
}

