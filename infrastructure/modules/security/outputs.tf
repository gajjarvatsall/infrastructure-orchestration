// infrastructure/modules/security/outputs.tf

output "eks_cluster_role_arn" {
  description = "ARN of the IAM role for the EKS control plane"
  value       = aws_iam_role.eks_cluster.arn
}

output "eks_node_role_arn" {
  description = "ARN of the IAM role for EKS worker nodes"
  value       = aws_iam_role.eks_node.arn
}
