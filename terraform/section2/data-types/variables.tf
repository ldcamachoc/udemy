/*variable "usernumber" {
  type = number
}*/

variable "elb_name" {
  type = string
}

variable "az" {
  type = list(string)
}

variable "timeout" {
  type = number
}