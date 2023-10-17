variable "project-id" {
  description = "The project id of the GCP project."
  default = "hidden-solstice-402121"
}

variable "region" {
  description = "The preferred region for deploying of cloud resources."
  default     = "europe-west2"
}

variable "auto_create_subnetworks" {
  description = "Create subnet automatically for the vpc"
  default = "false"
}

variable "network_name" {
  description = "Name of the virtual network"
  default = "proj-vpc"
}

variable "subnet_name" {
  description = "Name of subnet"
  default = "proj-subnet-public"
}

variable "ip_cidr_range" {
  description = "IP cidr range of subnet"
  default = "10.0.0.0/16"
}

variable "routing_mode" {
  description = "Sets the network-wide routing mode for Cloud Routers to use. Accepted values are 'GLOBAL' or 'REGIONAL'."
  default     = "REGIONAL" 
}

variable "private_access" {
  description = "Whether to allow private access to Google APIs without an external IP address."
  default     = "true"
}