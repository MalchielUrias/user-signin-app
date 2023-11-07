// Import IAM module
# module "iam" {
#   source = "../iam"
# }

# module "vpc" {
#   source = "../vpc"
# }

// Reference Data Source
# data "aws_subnets" "private_sub_id" {

# }

# data "aws_iam_role" "k8-iam-role-arn" {
#   name = "k8project-eks-iam-role"
# }

# data "aws_iam_role" "k8-worker-iam-role-arn" {
#   name = "k8-worker-iam-role"
# }
// Create EKS CLuster
resource "aws_eks_cluster" "k8-cluster" {
  name     = var.cluster_name
  role_arn = var.cluster_role_arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"] 

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    # module.iam.AmazonEKSClusterPolicy,
    # module.iam.AmazonEKSVPCResourceController,
    aws_cloudwatch_log_group.k8-cluster-log
  ]
}

// Create Cloudwatch Log for Control Plane Logging
resource "aws_cloudwatch_log_group" "k8-cluster-log" {
  # The log group name format is /aws/eks/<cluster-name>/cluster
  # Reference: https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html
  name              = "/aws/eks/${var.cluster_name}/cluster"
  retention_in_days = 1

  # ... potentially other configuration ...
}

// Create Self Managed NodePool
resource "aws_eks_node_group" "k8-managed-node" {
  cluster_name    = aws_eks_cluster.k8-cluster.name
  node_group_name = "k8-managed-node"
  node_role_arn   = var.worker_role_arn
  subnet_ids      = var.subnet_ids
  capacity_type = "SPOT" 

  scaling_config {
    desired_size = 3
    max_size     = 4
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  # depends_on = [
  #   module.iam.AmazonEKSWorkerNodePolicy,
  #   module.iam.AmazonEKS_CNI_Policy,
  #   module.iam.AmazonEC2ContainerRegistryReadOnly,
  # ]
}

// Create AWS Managed Nodepool

// Create Worker Nodes