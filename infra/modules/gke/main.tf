# Import vpc module 
module vpc {
    source = "../../../modules/vpc"
}

# Create GKE Cluster
resource "google_container_cluster" "userk8app-cluster" {
    name = var.cluster_name
    location = var.region

    remove_default_node_pool = true
    initial_node_count       = 3

    network = module.vpc.network_name
    subnetwork = module.vpc.subnet_name
  
}

# Create Node Pool for Cluster
resource "google_container_node_pool" "userk8app-nodepool" {
  name = var.nodepool_name
  location =  var.region
  cluster = google_container_cluster.userk8app-cluster.name
  node_count = var.nodepool_nodecount

  node_config {

    labels = {
      "project" = var.project-id
    }

    machine_type = "n1-standard-1"
    tags = [
        "gke-node",
        "${var.project-id}-gke"
    ]
    metadata = {
      disable-legacy-endpoints = "true"
    }
    
  }
}
