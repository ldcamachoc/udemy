output "bastion_host_subnet_us2w" {
  value = module.location_east1.bastion_host_subnet
}

output "web_server_lb_public_ip_id" {
  value = module.location_east1.web_server_lb_public_ip_id
}

