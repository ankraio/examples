variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region"
  default     = "europe-central2"
}

variable "zone" {
  description = "The GCP zone"
  default     = "europe-central2-a"
}

# VPC
variable "vpc_name" { default = "default-test" }
variable "subnet_name" { default = "subnet-1" }
variable "subnet_cidr" { default = "10.0.0.0/24" }

# GKE
variable "cluster_ipv4_cidr" { default = "10.11.0.0/21" }
variable "cluster_name" { default = "default-test" }
variable "master_ipv4_cidr" { default = "10.13.0.0/28" }
variable "services_ipv4_cidr" { default = "10.12.0.0/21" }

# Node Pools
variable "cluster_db_node_count" { default = 1 }
variable "cluster_db_machine_type" { default = "n1-standard-2" }
variable "cluster_db_locations" { default = "europe-central2-a" }
variable "cluster_node_count" { default = 1 }
variable "cluster_machine_type" { default = "n1-standard-1" }
variable "general_node_count" { default = 1}
variable "general_machine_type" { default = "n1-standard-1" }

# Compute (Bastion Host)
variable "bastion_internal_ip_name" { default = "bastion-internal-ip" }
variable "bastion_internal_ip_address" { default = "10.0.0.7" }
variable "bastion_external_ip_name" { default = "bastion-public-ip" }
variable "bastion_instance_name" { default = "bastion" }
variable "bastion_machine_type" { default = "e2-medium" }
variable "bastion_image" { default = "debian-cloud/debian-11" }
variable "bastion_ssh_keys" {
  description = "SSH keys for accessing the bastion host"
  default     = <<EOT
mattias:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBbr+bc5f+n5kIIm++SkvmZ2LX2Coff+TO+DC69XWbfi mattias@ankra.io
mark:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH0lTjp4WvJ4tA60xLQPpNXpAo3lKymXHGzvk3UpQOUp mash@Charizard.local
ben:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC6DCmtt+evb2/gsFNq6HeqerXOtpKf86pmr91vT2JNLLO+3ytfjg/PNxS9TdYtULP9IA6MWt494ITHn76Bx9BupP+zpOUjpGkUfVUNP8S7u8XOHo7tvbxdQw3a6apL8KztVuJa8wEvJpFhBak2svLqK0ph98OlOaH2MMY477QgQtGVogt1TQInQM/AERAvsTAMxYq4kgMk+OcAoC1nOttT5wy8DSEx87qiOporkBjsQfglDxBR4GDZTEtBnBXJvCoT/ZnjlWRxEky0BgXKrcEWX5eWVPMWxiVURNbLX2shT1EqJ6eeDv9S9NEr5ACDg+ZOQYf0vH+/UOjTySmUYSw7+WaMCDph+mbMnwE0pU9W490OjkTSIDEKwtgTTgmR/VSzjMV25p9KPsCXS0LONHBDxrhU0BMk+CFSEa1JWZvwUwkd52VrxtZn/aaqVuIc0ulqUgtwpgfmOel6aqznfjRMRzAfWHwVunpyCs6L+8ZU7u6unz7WEZFjDRG1TjzkKok= ben@Benjamins-MacBook-Pro.local
robbert:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFP71IjKYxco9Je1LA3CgQDQt5keAShR6MowhkWZUHsv robbert@ankra.io
EOT
}

# Firewall
variable "firewall_name" { default = "allow-ssh-from-internet" }

# NAT
variable "router_name" { default = "nat-router" }
variable "nat_name" { default = "nat-config" }
