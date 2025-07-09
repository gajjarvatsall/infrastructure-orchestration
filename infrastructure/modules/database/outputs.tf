// infrastructure/modules/database/outputs.tf

output "db_endpoint" {
  description = "RDS endpoint address"
  value       = aws_db_instance.this.address
}

output "db_port" {
  description = "RDS port"
  value       = aws_db_instance.this.port
}

output "cache_endpoint" {
  description = "Redis endpoint address"
  value       = aws_elasticache_cluster.this.cache_nodes[0].address
}

output "cache_port" {
  description = "Redis port"
  value       = aws_elasticache_cluster.this.port
}
