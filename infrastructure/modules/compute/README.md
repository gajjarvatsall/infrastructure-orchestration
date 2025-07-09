# Compute Module (EKS)

## Description
Provision an EKS cluster with one or more managed node groups.

## Inputs
| Name                    | Type         | Description                                    |
|-------------------------|--------------|------------------------------------------------|
| name_prefix             | string       | Prefix for naming resources                    |
| cluster_role_arn        | string       | IAM Role ARN for control plane                 |
| node_role_arn           | string       | IAM Role ARN for worker nodes                  |
| private_subnet_ids      | list(string) | Subnet IDs for nodes & pods                    |
| tags                    | map(string)  | Additional tags                                |
| enable_control_plane_logs | list(string) | Control plane logs to enable                   |
| node_groups             | map(object) | Definitions of node groups (see variable doc)  |

## Outputs
| Name                   | Description               |
|------------------------|---------------------------|
| cluster_name           | EKS cluster name          |
| cluster_endpoint       | EKS API endpoint          |
| cluster_ca_certificate | Base64 CA certificate     |
| node_group_names       | List of node group names  |
