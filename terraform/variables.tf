variable "subnets" {
  type        = list(string)
  description = "List of subnets"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "cidr" {
  type        = list(string)
  description = "CIDR values for Security Group"
}

variable "s3_bucket_name_for_ecs_logs" {
  type        = string
  description = "Name for the S3 bucket used for ECS access logs"
  default     = "rearc-quest-ecs-access-logs"
}

variable "ecr_repository_name" {
  type        = string
  description = "Name of the ECR repository"
  default     = "rearc-quest-repo"
}

variable "ecs_cluster_name" {
  type        = string
  description = "Name of the ECS cluster"
  default     = "rearc-quest-cluster"
}

variable "ecs_service_name" {
  type        = string
  description = "Name of ECS service"
  default     = "rearc-quest-service"
}

variable "ecs_task_definition_name" {
  type        = string
  description = "Name of ECS task definition"
  default     = "rearc-quest-task-definition"
}

variable "lb_name" {
  type        = string
  description = "Name of Elastic Load Balancer"
  default     = "quest-lb"
}

variable "ssl_cert_name" {
  type        = string
  description = "Name of ssl certificate"
  default     = "quest-self-signed-ssl-cert"
}

variable "lb_target_grp_name" {
  type        = string
  description = "Name of the LB target group"
  default     = "quest-lb-tg-grp"
}

variable "lb_security_group_name" {
  type        = string
  description = "Name of load balancer sg"
  default     = "quest_lb_sg"
}

variable "ecr_docker_image_version" {
  type        = string
  description = "Tag/version of the upload docker image in ECR"
}

variable "quest_secret_word" {
  type        = string
  description = "Rearc Quest Secret word"
}

variable "ssl_cert_body_path" {
  type        = string
  description = "File path for ssl cert body"
}

variable "ssl_cert_private_file_path" {
  type        = string
  description = "File path for ssl cert private key"
}

variable "local_docker_image_id" {
  type        = string
  description = "Local Docker image ID"
}
