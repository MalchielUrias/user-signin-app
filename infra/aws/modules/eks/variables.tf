variable "cluster_name" {
    default = "k8-cluster"
    description = "eks cluster name"
}

variable "cluster_role_arn" {
  description = "role arn for cluster"
}

variable "worker_role_arn" {
  description = "role arn for worker"
}

variable "subnet_ids" {
  description = "vpc subnet ids"
}