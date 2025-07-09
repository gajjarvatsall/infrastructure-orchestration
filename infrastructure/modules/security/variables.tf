// infrastructure/modules/security/variables.tf

variable "name_prefix" {
  type        = string
  description = "Prefix for naming IAM roles"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to all resources"
}
