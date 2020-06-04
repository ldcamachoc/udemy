module "ec2_cluster" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  name           = "my-cluster"
  instance_count = 1

  ami           = "ami-0323c3dd2da7fb37d"
  instance_type = "t2.micro"
  subnet_id     = "subnet-54ec1f0b"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}