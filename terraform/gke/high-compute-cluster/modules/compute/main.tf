resource "google_compute_address" "internal_ip" {
  address_type = "INTERNAL"
  region       = var.region
  subnetwork   = var.subnetwork_id
  name         = var.internal_ip_name
  address      = var.internal_ip_address
}

resource "google_compute_address" "external_ip" {
  address_type = "EXTERNAL"
  region       = var.region
  name         = var.external_ip_name
}

resource "google_compute_instance" "bastion_host" {
  zone         = var.zone
  name         = var.instance_name
  machine_type = var.machine_type
  tags         = ["allow-ssh"]

  metadata = {
    ssh-keys = var.ssh_keys
  }

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network    = var.network_name
    subnetwork = var.subnetwork_id
    network_ip = google_compute_address.internal_ip.address

    access_config {
      nat_ip = google_compute_address.external_ip.address
    }
  }
}
