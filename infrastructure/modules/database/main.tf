// infrastructure/modules/database/main.tf

######################################
# 1. RDS (Free‑Tier MySQL/PostgreSQL)
######################################
resource "aws_db_subnet_group" "this" {
  name       = "${var.name_prefix}-db-subnet-group"
  subnet_ids = var.private_subnet_ids
  tags       = merge(var.tags, { "Name" = "${var.name_prefix}-db-subnet-group" })
}

resource "aws_db_instance" "this" {
  identifier               = "${var.name_prefix}-db"
  engine                   = var.db_engine
  engine_version           = var.db_engine_version
  instance_class           = var.instance_class
  allocated_storage        = var.allocated_storage
  storage_type             = var.storage_type
  username                 = var.username
  password                 = var.password
  db_subnet_group_name     = aws_db_subnet_group.this.name
  vpc_security_group_ids   = var.security_group_ids
  multi_az                 = var.multi_az
  publicly_accessible      = false
  skip_final_snapshot      = true
  backup_retention_period  = var.backup_retention_days
  performance_insights_enabled = var.performance_insights_enabled
  tags                     = merge(var.tags, { "Name" = "${var.name_prefix}-db" })
}

######################################
# 2. ElastiCache (Redis)
######################################
resource "aws_elasticache_subnet_group" "this" {
  name       = "${var.name_prefix}-cache-subnet-group"
  subnet_ids = var.private_subnets_for_cache
}

resource "aws_elasticache_cluster" "this" {
  cluster_id           = "${var.name_prefix}-redis"
  engine               = "redis"
  node_type            = var.cache_node_type
  num_cache_nodes      = var.num_cache_nodes
  subnet_group_name    = aws_elasticache_subnet_group.this.name
  parameter_group_name = "default.redis6.x"
  port                 = var.cache_port
  apply_immediately    = true
  tags                 = merge(var.tags, { "Name" = "${var.name_prefix}-redis" })
}
