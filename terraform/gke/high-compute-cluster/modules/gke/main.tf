resource "google_container_cluster" "gke-cluster" {
  name                     = var.cluster_name
  location                 = var.region
  network                  = var.network
  subnetwork               = var.subnetwork
  remove_default_node_pool = true
  initial_node_count       = 1
  deletion_protection      = false
  default_max_pods_per_node = 110

  logging_config {
    enable_components = []
  }

  monitoring_config {
    enable_components = []
    managed_prometheus {
      enabled = false
    }
  }

  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes    = true
    master_ipv4_cidr_block  = var.master_ipv4_cidr
  }

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = var.cluster_ipv4_cidr
    services_ipv4_cidr_block = var.services_ipv4_cidr
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = "${var.bastion_internal_ip_address}/32"
      display_name = "Bastion Host"
    }
  }
}

resource "google_container_node_pool" "cluster-db-nodes" {
  name       = "${var.cluster_name}-cluster-db-node-pool"
  cluster    = google_container_cluster.gke-cluster.id
  node_count = var.cluster_db_node_count

  node_locations = var.cluster_db_locations

  node_config {
    machine_type = var.cluster_db_machine_type
    preemptible  = false
    disk_size_gb = 50
    metadata = {
      disable-legacy-endpoints = "true"
    }
    labels = {
      purpose = "cluster-db"
    }
    taint {
      key    = "purpose"
      value  = "cluster-db"
      effect = "NO_SCHEDULE"
    }
  }
}

resource "google_container_node_pool" "cluster-nodes" {
  name       = "${var.cluster_name}-cluster-node-pool"
  cluster    = google_container_cluster.gke-cluster.id
  location   = var.region
  node_count = var.cluster_node_count
  autoscaling {
    max_node_count = 6
    min_node_count = 1
  }

  node_locations = ["${var.region}-a", "${var.region}-b", "${var.region}-c"]

  node_config {
    machine_type = var.cluster_machine_type
    preemptible  = false
    disk_size_gb = 50
    metadata = {
      disable-legacy-endpoints = "true"
    }
    labels = {
      purpose = "cluster"
    }
    taint {
      key    = "purpose"
      value  = "cluster"
      effect = "NO_SCHEDULE"
    }
  }
}

resource "google_container_node_pool" "general-nodes" {
  name       = "${var.cluster_name}-general-node-pool"
  cluster    = google_container_cluster.gke-cluster.id
  location   = var.region
  node_count = var.general_node_count

  node_locations = ["${var.region}-a", "${var.region}-b", "${var.region}-c"]

  node_config {
    machine_type = var.general_machine_type
    preemptible  = false
    disk_size_gb = 50
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}
