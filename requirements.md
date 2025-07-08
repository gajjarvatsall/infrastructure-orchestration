# Project Requirements & Constraints

## 1. Business Context & Goals
- **Startup Profile**: FinTech scaling from 10K → 1M+ users  
- **Primary Objectives**:  
  - Consistent infra across dev/staging/prod  
  - Real‑time cost visibility & optimization  
  - Security & compliance guardrails  

## 2. Environment Matrix
| Environment | AWS Account / LocalStack | Region(s)        | Scale                   |
| ----------- | ------------------------ | ---------------- | ----------------------- |
| **dev**     | Free‑Tier AWS / LocalStack | us‑east‑1       | Single AZ, t2.micro     |
| **staging** | Free‑Tier AWS            | eu‑west‑1        | Multi‑AZ, spot t3.medium|
| **prod**    | Free‑Tier AWS            | us‑east‑1, ap‑south‑1 | Auto‑Scaling, spot + on‑demand |

## 3. Infrastructure Components
1. **Networking**  
   - VPC w/ public & private subnets  
   - Internet & NAT gateway (or instance)  
   - Route 53 public/private zones  
2. **Compute & Orchestration**  
   - EKS cluster + managed node groups  
   - Spot instance integration  
   - Helm provider for app deployments  
3. **Data Layer**  
   - RDS (MySQL/PostgreSQL) + read replicas  
   - ElastiCache (Redis) for sessions  
4. **Edge & CDN**  
   - CloudFront distribution  
   - WAF (OWASP rules)  
5. **Cost & Observability**  
   - AWS Cost Explorer API  
   - Grafana dashboards (free tier)  
   - Rightsizing recommendations via Compute Optimizer  
6. **Security & Compliance**  
   - VPC Flow Logs → CloudWatch  
   - GuardDuty, AWS Config  
   - Terraform‑native policy checks (OPA/Sentinel)

## 4. Cost Constraints
- **AWS Free Tier Limits**:  
  - EC2: 750 hrs t2.micro monthly  
  - RDS: 750 hrs db.t2.micro monthly  
  - S3, CloudWatch, Lambda free‑tier quotas  
- **Monthly Budget Cap**: \$0 (destroy idle environments)

## 5. Compliance & Security Baseline
- **Encryption**: At‑rest + in‑transit for DB, cache  
- **Least‑Privilege**: IAM roles scoped to each module  
- **Alerting**: SNS/email for budget overrun (> \$0.01)
