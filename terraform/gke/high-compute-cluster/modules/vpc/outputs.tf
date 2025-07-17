output "network_name" {
  description = "The name of the created VPC network."
  value       = google_compute_network.vpc.name
}

output "subnetwork_name" {
  description = "The name of the created subnetwork."
  value       = google_compute_subnetwork.subnet.name
}

output "subnetwork_id" {
  description = "The ID of the created subnetwork."
  value       = google_compute_subnetwork.subnet.id
}
