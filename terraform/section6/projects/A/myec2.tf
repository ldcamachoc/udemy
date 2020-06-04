module "ec2Module" {
  source = "../../modules/ec2"
  instance_type = "t2.medium"
}