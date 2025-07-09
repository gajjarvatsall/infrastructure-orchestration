# Security Module (IAM)

## Description
Creates two IAM roles for EKS:
1. **eks_cluster** – control‑plane role with AmazonEKSClusterPolicy & AmazonEKSServicePolicy  
2. **eks_node** – worker‑node role with EKSWorkerNode, ECRReadOnly & CNI policies  

## Inputs
| Name         | Type         | Description                     |
|--------------|--------------|---------------------------------|
| name_prefix  | string       | Prefix for role names           |
| tags         | map(string)  | Tags to apply                   |

## Outputs
| Name                    | Description                                    |
|-------------------------|------------------------------------------------|
| eks_cluster_role_arn    | ARN for the EKS control‑plane IAM role         |
| eks_node_role_arn       | ARN for the EKS worker‑node IAM role           |
