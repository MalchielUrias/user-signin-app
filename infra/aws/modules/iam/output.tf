output "k8-iam-role-arn" {
    value = aws_iam_role.k8-iam-role.arn
}

output "k8-worker-iam-role-arn" {
    value = aws_iam_role.k8-worker-iam-role.arn
}