resource "aws_instance" "myweb" {
  ami = data.aws_ami.app_ami.id
  instance_type = var.instance_type
}