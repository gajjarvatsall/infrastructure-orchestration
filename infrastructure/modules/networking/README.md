# Networking Module

## Description
Provision a VPC with public and private subnets across multiple AZs.

## Inputs
| Name            | Type         | Description                                   |
|-----------------|--------------|-----------------------------------------------|
| name_prefix     | string       | Prefix for resource naming                    |
| vpc_cidr        | string       | CIDR block for the VPC                        |
| azs             | list(string) | Availability Zones for subnets                |
| public_subnets  | list(string) | CIDR blocks for public subnets                |
| private_subnets | list(string) | CIDR blocks for private subnets               |

## Outputs
| Name               | Description                |
|--------------------|----------------------------|
| vpc_id             | ID of the created VPC      |
| public_subnet_ids  | IDs of public subnets      |
| private_subnet_ids | IDs of private subnets     |
