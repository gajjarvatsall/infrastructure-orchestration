// infrastructure/modules/compute/variables.tf

variable "name_prefix" {
  type        = string
  description = "Prefix for all compute resources"
}

variable "cluster_role_arn" {
  type        = string
  description = "IAM Role ARN for EKS control plane"
}

variable "node_role_arn" {
  type        = string
  description = "IAM Role ARN for EKS worker nodes"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "Private subnet IDs for EKS pods & nodes"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags to apply to all resources"
}

variable "enable_control_plane_logs" {
  type        = list(string)
  default     = ["api", "audit", "authenticator"]
  description = "Control plane log types to enable"
}

variable "node_groups" {
  type = map(object({
    desired_size  = number
    max_size      = number
    min_size      = number
    instance_types= list(string)
    capacity_type = string  # ON_DEMAND or SPOT
  }))
  description = "Definition for one or more EKS node groups"
}
