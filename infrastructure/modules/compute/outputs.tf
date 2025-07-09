// infrastructure/modules/compute/outputs.tf

output "cluster_name" {
  value       = aws_eks_cluster.this.name
  description = "EKS cluster name"
}

output "cluster_endpoint" {
  value       = aws_eks_cluster.this.endpoint
  description = "EKS API endpoint"
}

output "cluster_ca_certificate" {
  value       = aws_eks_cluster.this.certificate_authority[0].data
  description = "Base64-encoded CA cert"
}

output "node_group_names" {
  value       = keys(aws_eks_node_group.managed)
  description = "Names of provisioned node groups"
}
