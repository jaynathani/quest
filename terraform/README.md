# Terraform scripts for running Rearc Quest
These terraform modules focus on deploying Rearc's Quest (a node app) in containers behind a Load Balancer on HTTPS. You can either choose to source the root module that will spin up all the resources or you can source the sub-modules individually.

## Pre-requisites
- AWS CLI (version: 2.1.18)
- Terraform (developed on v0.14.5)

## Providers
I developed using the following versions:
- aws v3/25/0
- null v3.0.0

## Resources created
- 1 ECR repository
- 1 ECS Cluster
- 1 ECS Service
- 1 ECS Task Definition
- 1 S3 bucket for ECS access logs
- 1 S3 bucket policy
- 1 IAM Role (ECS Task Execution Role)
- 1 IAM Role Policy Document
- 1 ELB (Application LB)
- 1 ELB Target Group
- 2 ELB Listeners (HTTP and HTTPS)
- 1 Security Group (For load balancer)
- 1 Security Group (ECS access to Load Balancer)
- 1 AWS IAM Server Certificate (For self-signed SSL cert)

## Reference
- https://docs.aws.amazon.com/AmazonECR/latest/userguide/getting-started-cli.html