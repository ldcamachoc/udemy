variable "sg_ports" {
  type        = list(number)
  description = "list of the ingress ports"
  default     = [8200, 8201, 8300, 9200, 9500]
}