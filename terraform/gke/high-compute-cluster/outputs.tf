output "network_name" {
  description = "The name of the VPC network."
  value       = module.vpc.network_name
}

output "subnetwork_name" {
  description = "The name of the subnetwork."
  value       = module.vpc.subnetwork_name
}

output "cluster_name" {
  description = "The name of the GKE cluster."
  value       = module.gke.cluster_name
}

output "cluster_endpoint" {
  description = "The endpoint for the GKE cluster."
  value       = module.gke.cluster_endpoint
}

output "bastion_internal_ip" {
  description = "The internal IP of the bastion host."
  value       = module.compute.internal_ip
}

output "bastion_external_ip" {
  description = "The external IP of the bastion host."
  value       = module.compute.external_ip
}

output "nat_gateway_name" {
  description = "The name of the Cloud NAT configuration."
  value       = module.nat.nat_gateway_name
}

output "ssh_config" {
  description = "SSH configuration for accessing the Kubernetes cluster."
  value = "Host ${var.cluster_name}\n  HostName ${module.compute.external_ip}\n  User REPLACE_ME\n  LocalForward 127.0.0.1:6450 ${module.gke.cluster_endpoint}:443"
}