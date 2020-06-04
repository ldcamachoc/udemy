provider "aws" {
  region = "us-east-1"
  version = "2.7"
  access_key = "AKIASYCL2FWCU3XYOZ66"
  secret_key = "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"
}

# Create a new load balancer
resource "aws_elb" "bar" {
  name               = var.elb_name
  availability_zones = var.az

   listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }


  cross_zone_load_balancing   = true
  idle_timeout                = var.timeout
  connection_draining         = true
  connection_draining_timeout = var.timeout

  tags = {
    Name = "foobar-terraform-elb"
  }
}