// infrastructure/environments/dev/main.tf

terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "2.8.0"
    }
  }
}

provider "helm" {
  kubernetes {
    host                   = module.compute.cluster_endpoint
    cluster_ca_certificate = base64decode(module.compute.cluster_ca_certificate)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      args        = ["eks", "get-token", "--cluster-name", module.compute.cluster_name]
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "networking" {
  source          = "../../modules/networking"
  name_prefix     = "dev"
  vpc_cidr        = "10.0.0.0/16"
  azs             = ["us-east-1a", "us-east-1b"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.11.0/24", "10.0.12.0/24"]
}


module "security" {
  source      = "../../modules/security"
  name_prefix = "dev"
  tags        = { Environment = "dev" }
}


module "compute" {
  source             = "../../modules/compute"
  name_prefix        = "dev"
  cluster_role_arn   = module.security.eks_cluster_role_arn
  node_role_arn      = module.security.eks_node_role_arn
  private_subnet_ids = module.networking.private_subnet_ids
  tags               = { Environment = "dev" }
  node_groups = {
    ng1 = {
      desired_size   = 1
      min_size       = 1
      max_size       = 2
      instance_types = ["t3.medium"]
      capacity_type  = "SPOT"
    }
  }
}


############################################################################
# After networking, security, compute blocks, append:

module "database" {
  source                    = "../../modules/database/variables.tf"
  name_prefix               = "dev"
  private_subnet_ids        = module.networking.private_subnet_ids
  private_subnets_for_cache = module.networking.private_subnet_ids
  security_group_ids        = [aws_security_group.db.id]
  username                  = var.db_username
  password                  = var.db_password
  tags                      = { Environment = "dev" }
}
