output "network" {
  value       = module.vpc
  description = "The created network"
}

output "subnets" {
  value       = module.vpc.network_name
  description = "A map with keys of form subnet_region/subnet_name and values being the outputs of the google_compute_subnetwork resources used to create corresponding subnets."
}

output "network_name" {
  value       = module.vpc.network_name
  description = "The name of the VPC being created"
}

output "network_id" {
  value       = module.vpc.network_id
  description = "The ID of the VPC being created"
}

output "subnets_private_access" {
  value       = module.vpc.subnet_private_access
  description = "Whether the subnets will have access to Google API's without a public IP"
}


