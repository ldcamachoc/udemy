provider "aws" {
  region = "us-east-1"
  version = "2.7"
  access_key = "AKIASYCL2FWCU3XYOZ66"
  secret_key = "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"
}
/*
resource "aws_instance" "instance-1" {
  ami = "ami-0323c3dd2da7fb37d"
  instance_type = "t2.micro"
  count = 3
}
*/

variable "elb_names" {
  type = list(string)
  default = ["dev-loadbalancer","stage-loadbalancer","prod-loadbalancer"]
}


resource "aws_iam_user" "lb" {
  #name = "loadbalancerUser-${count.index}"
  name = var.elb_names[count.index]
  count = 3
  path = "/system/"
}
