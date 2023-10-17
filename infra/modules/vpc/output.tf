output "network_name" {
  value       = google_compute_network.proj-vpc.name
  description = "The name of the VPC being created"
}

output "network_id" {
  value       = google_compute_network.proj-vpc.id
  description = "The ID of the VPC being created"
}

output "subnet_name" {
  value = google_compute_subnetwork.proj-subnet-public.name
  description = "The subnet name"
}

output "subnet_private_access" {
  value = google_compute_subnetwork.proj-subnet-public.private_ip_google_access
  description = "The subnet private access"
}