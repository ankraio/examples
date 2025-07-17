resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = var.subnet_cidr
}

resource "google_compute_router" "router" {
  project = var.project_id
  name    = var.router_name
  network = var.vpc_name
  region  = var.region
}
