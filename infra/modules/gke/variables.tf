variable "cluster_name" {
  default = "userk8app-cluster"
  description = "Name of our kubernetes cluster"
}

variable "region" {
  description = "The preferred region for deploying of cloud resources."
  default     = "europe-west2"
}

variable "nodepool_name" {
  description = "The default name for the nodepool"
  default = "userk8app-nodepool"
}

variable "nodepool_nodecount" {
  description = "The default number of nodes on creation"
  default = 3
}

variable "project-id" {
  description = "The project id of the GCP project."
  default     = "hidden-solstice-402121"
}