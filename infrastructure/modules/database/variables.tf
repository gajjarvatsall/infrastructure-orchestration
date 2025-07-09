// infrastructure/modules/database/variables.tf

variable "name_prefix" {
  type        = string
  description = "Prefix for database and cache resources"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "Subnet IDs for RDS subnet group"
}

variable "private_subnets_for_cache" {
  type        = list(string)
  description = "Subnet IDs for ElastiCache subnet group"
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security group IDs applied to RDS"
}

variable "db_engine" {
  type        = string
  description = "Database engine (e.g., mysql or postgres)"
  default     = "mysql"
}

variable "db_engine_version" {
  type        = string
  description = "Engine version"
  default     = "8.0"
}

variable "instance_class" {
  type        = string
  description = "RDS instance class (free‑tier: db.t2.micro)"
  default     = "db.t2.micro"
}

variable "allocated_storage" {
  type        = number
  description = "Storage in GB"
  default     = 20
}

variable "storage_type" {
  type        = string
  description = "Storage type (gp2/gp3)"
  default     = "gp2"
}

variable "username" {
  type        = string
  description = "Master username for the database"
}

variable "password" {
  type        = string
  description = "Master password (store in secrets manager or vault)"
  sensitive   = true
}

variable "multi_az" {
  type        = bool
  description = "Enable multi‑AZ for RDS"
  default     = false
}

variable "backup_retention_days" {
  type        = number
  description = "Backup retention period in days"
  default     = 7
}

variable "performance_insights_enabled" {
  type        = bool
  description = "Enable Performance Insights"
  default     = false
}

variable "cache_node_type" {
  type        = string
  description = "ElastiCache node type (free‑tier: cache.t2.micro)"
  default     = "cache.t2.micro"
}

variable "num_cache_nodes" {
  type        = number
  description = "Number of cache nodes"
  default     = 1
}

variable "cache_port" {
  type        = number
  description = "Redis port"
  default     = 6379
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags for all resources"
}
