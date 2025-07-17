output "internal_ip" {
  description = "The internal IP address of the bastion host."
  value       = google_compute_address.internal_ip.address
}

output "external_ip" {
  description = "The external IP address of the bastion host."
  value       = google_compute_address.external_ip.address
}

output "instance_name" {
  description = "The name of the bastion host instance."
  value       = google_compute_instance.bastion_host.name
}
