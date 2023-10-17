// VPC creation

resource "google_compute_network" "proj-vpc" {
  name = var.network_name
  project = var.project-id
  routing_mode = var.routing_mode
  auto_create_subnetworks = var.auto_create_subnetworks
}

// subnet creation

resource "google_compute_subnetwork" "proj-subnet-public" {
    name = var.subnet_name
    ip_cidr_range = var.ip_cidr_range
    region = var.region 
    network = google_compute_network.proj-vpc.id 
    private_ip_google_access = var.private_access
}

// route creation

// firewall creation

// NAT gateway creation

// route table creation 