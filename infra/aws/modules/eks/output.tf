output "endpoint" {
  value = aws_eks_cluster.k8-cluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.k8-cluster.certificate_authority[0].data
}