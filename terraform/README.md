# Terraform scripts for running Rearc Quest
These terraform modules focus on deploying Rearc's Quest (a node app) in containers behind a Load Balancer on HTTPS. You can either choose to source the root module that will spin up all the resources or you can source the sub-modules individually.

## Pre-requisites
- AWS CLI (version: 2.1.18)
- Terraform (developed on v0.14.5)
- A self-signed ssl certificate
- A docker image is built locally referencing the [Dockerfile](https://github.com/jaynathani/quest/blob/master/Dockerfile)

## Providers
I developed using the following versions:
- aws v3.25.0
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

## Example usage
You can source and deploy the resources using the root terraform module as follows:
```
    module rearc-quest{
      source = "git::https://github.com/jaynathani/quest//terraform"
      ecr_docker_image_version = "v1"
      local_docker_image_id = "<local-docker-image-id>"
      quest_secret_word = "<quest-secret-word>"
      ssl_cert_body_path = "path/to/ssl/public/crt"
      ssl_cert_private_file_path = "path/to/ssk/private/pem"
      subnets = ["subnet-example"]
      vpc_id = "vpc-example"
    }
```

Run `terraform apply` after you source the module in a similar way as shown above. Once the creation is complete, you will have to wait for a few minutes until the containers are provisioned. You can check the status of that on the ECS page under Cluster > Tasks. After the containers are in `RUNNING` state, open the load balancer DNS in Safari (Google Chrome did not let me open an https url that had a self-signed certificate).

## Reference
- https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/configuring-https-ssl.html
- https://docs.aws.amazon.com/AmazonECR/latest/userguide/getting-started-cli.html