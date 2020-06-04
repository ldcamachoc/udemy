resource "aws_iam_user" "ld" {
  name = var.iam_user
  path = "/system/"
}