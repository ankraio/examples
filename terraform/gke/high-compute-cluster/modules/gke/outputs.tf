output "cluster_name" {
  description = "The name of the GKE cluster."
  value       = google_container_cluster.gke-cluster.name
}

output "cluster_endpoint" {
  description = "The endpoint for the GKE cluster."
  value       = google_container_cluster.gke-cluster.endpoint
}
