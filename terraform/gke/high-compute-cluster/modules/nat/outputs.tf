output "nat_gateway_name" {
  description = "The name of the Cloud NAT configuration."
  value       = module.cloud_nat.name
}

output "router_name" {
  description = "The name of the router used for NAT."
  value       = var.router_name
}
