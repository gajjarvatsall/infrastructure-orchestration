// infrastructure/modules/compute/main.tf

######################
# 1. EKS Control Plane
######################
resource "aws_eks_cluster" "this" {
  name     = "${var.name_prefix}-eks"
  role_arn = var.cluster_role_arn

  vpc_config {
    subnet_ids = var.private_subnet_ids
  }

  # Optional logging
  enabled_cluster_log_types = var.enable_control_plane_logs

  tags = merge(var.tags, { "Name" = "${var.name_prefix}-eks" })
}

######################
# 2. EKS Node Group(s)
######################
resource "aws_eks_node_group" "managed" {
  for_each = var.node_groups

  cluster_name    = aws_eks_cluster.this.name
  node_group_name = each.key
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.private_subnet_ids

  scaling_config {
    desired_size = each.value.desired_size
    max_size     = each.value.max_size
    min_size     = each.value.min_size
  }

  instance_types = each.value.instance_types
  capacity_type  = each.value.capacity_type

  tags = merge(var.tags, { "Name" = each.key })
}
