resource "aws_instance" "myec2" {
  ami = "ami-09d95fab7fff3776c"
  instance_type = "t2.micro"
  #key_name = "local-exec"

  connection {
    type = "ssh"
    user = "ec2-user"
    host = self.private_ip
    private_key = file("./login-key.pem")
    agent = false

    provisioner "local-exec" {
      command = "echo ${aws_instance.myec2.private_ip} >> private_ips.txt"
    }
  }
}