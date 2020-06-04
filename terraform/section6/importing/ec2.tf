resource "aws_instance" "myec2" {
  ami = "ami-09d95fab7fff3776c"
  instance_type = "t2.micro"
  key_name = "key-login-2"
  vpc_security_group_ids = ["sg-0ab4d030f38b6beae"]
  subnet_id = "subnet-14e0da2a"
  tags = {
    Name="manual"
  }
}