resource "aws_security_group" "dynamicsg" {
  name        = "dynamic-sg"
  description = "Ingres for Vault"

  /* dynamic "ingress" {
     for_each = var.sg_ports
     content {
       from_port = ingress.value
       to_port = ingress.value
       protocol = "tcp"
       cidr_blocks = ["0.0.0.0/0"]
     }
   }*/

  dynamic "ingress" {
    for_each = var.sg_ports
    iterator = port
    content {
      from_port = port.value
      to_port   = port.value
      protocol  = "tcp"
      cidr_blocks = [
      "0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = var.sg_ports
    content {
      from_port = egress.value
      to_port   = egress.value
      protocol  = "tcp"
      cidr_blocks = [
      "0.0.0.0/0"]
    }
  }
}