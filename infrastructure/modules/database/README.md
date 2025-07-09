# Database Module

## Description
Provisions a free‑tier RDS instance (MySQL/PostgreSQL) and an ElastiCache Redis cluster.

## Inputs
| Name                    | Type         | Description                                |
|-------------------------|--------------|--------------------------------------------|
| name_prefix             | string       | Prefix for resource naming                 |
| private_subnet_ids      | list(string) | Subnet IDs for RDS                         |
| private_subnets_for_cache| list(string)| Subnet IDs for ElastiCache                 |
| security_group_ids      | list(string) | Security groups for RDS                    |
| db_engine               | string       | Database engine (mysql/postgres)           |
| db_engine_version       | string       | DB engine version                          |
| instance_class          | string       | RDS instance class (e.g., db.t2.micro)     |
| allocated_storage       | number       | Storage GB                                 |
| username                | string       | RDS master username                        |
| password                | string       | RDS master password (sensitive)            |
| multi_az                | bool         | Enable multi‑AZ deployment                 |
| backup_retention_days   | number       | Backup retention                           |
| performance_insights_enabled | bool   | Enable PI                                 |
| cache_node_type         | string       | Cache node type (e.g., cache.t2.micro)     |
| num_cache_nodes         | number       | Number of Redis nodes                      |
| cache_port              | number       | Redis port                                 |
| tags                    | map(string) | Tags for all resources                     |

## Outputs
| Name           | Description           |
|----------------|-----------------------|
| db_endpoint    | RDS endpoint address  |
| db_port        | RDS port              |
| cache_endpoint | Redis endpoint address|
| cache_port     | Redis port            |
