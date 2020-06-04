provider "aws" {
  region = "us-east-1"
  version = "2.7"
  access_key = "AKIASYCL2FWCU3XYOZ66"
  secret_key = "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"
}

resource "aws_instance" "myec2" {
  ami = "ami-0323c3dd2da7fb37d"
  #instance_type = var.types["us-east-1"]
  instance_type = var.list[0]
}

variable "list" {
  type = list
  default = ["m5.large","m5.xlarge","t2.medium"]
}

variable "types" {
  type = map
  default = {
    us-east-1  = "t2.micro"
    us-west-2  = "t2.nano"
    ap-south-1 = "t2.small"
  }
}