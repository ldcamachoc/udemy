resource "aws_instance" "myec2" {
  ami           = "ami-054362537f5132ce2"
  instance_type = "t2.micro"
}

resource "aws_instance" "newec2" {
  ami           = "ami-054362537f5132ce2"
  instance_type = "t2.micro"
}