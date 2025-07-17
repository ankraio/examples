# VPC Module
module "vpc" {
  source      = "./modules/vpc"
  vpc_name    = var.vpc_name
  subnet_name = var.subnet_name
  subnet_cidr = var.subnet_cidr
  region      = var.region
  router_name = var.router_name
  project_id  = var.project_id
}

# GKE Module
module "gke" {
  source                      = "./modules/gke"
  cluster_name                = var.cluster_name
  zone                        = var.zone
  network                     = module.vpc.network_name
  subnetwork                  = module.vpc.subnetwork_name
  master_ipv4_cidr            = var.master_ipv4_cidr
  cluster_ipv4_cidr           = var.cluster_ipv4_cidr
  services_ipv4_cidr          = var.services_ipv4_cidr
  cluster_db_node_count       = var.cluster_db_node_count
  cluster_db_locations         = var.cluster_db_locations
  cluster_node_count          = var.cluster_node_count
  general_node_count          = var.general_node_count
  cluster_db_machine_type     = var.cluster_db_machine_type
  cluster_machine_type        = var.cluster_machine_type
  general_machine_type        = var.general_machine_type
  bastion_internal_ip_address = var.bastion_internal_ip_address
  region                      = var.region
}

# Compute Module (Bastion Host)
module "compute" {
  source              = "./modules/compute"
  region              = var.region
  zone                = var.zone
  network_name        = module.vpc.network_name
  subnetwork_id       = module.vpc.subnetwork_id
  internal_ip_name    = var.bastion_internal_ip_name
  internal_ip_address = var.bastion_internal_ip_address
  external_ip_name    = var.bastion_external_ip_name
  instance_name       = var.bastion_instance_name
  machine_type        = var.bastion_machine_type
  ssh_keys            = var.bastion_ssh_keys
  image               = var.bastion_image
}

# Firewall Module
module "firewall" {
  source        = "./modules/firewall"
  firewall_name = var.firewall_name
  network_name  = module.vpc.network_name
}

# NAT Module
module "nat" {
  source      = "./modules/nat"
  project_id  = var.project_id
  region      = var.region
  router_name = var.router_name
  nat_name    = var.nat_name
}
