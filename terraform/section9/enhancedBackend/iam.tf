terraform {
  required_version = "~> 0.26.0"
  backend "remote" {}
}

resource "aws_iam_user" "lb" {
  name = "remoteuser"
  path = "/system/"
}