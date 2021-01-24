variable "subnets" {
  type = list(string)
  description = "List of subnets"
}

variable "cidr" {
  type = string
  description = "CIDR value for Security Group"
  default = "71.248.165.247/32"
}

variable "s3_bucket_name_for_ecs_logs" {
  type = string
  description = "Name for the S3 bucket used for ECS access logs"
  default = "rearc-quest-ecs-access-logs"
}

variable "ecr_repository_name" {
  type = string
  description = "Name of the ECR repository"
  default = "rearc-quest-repo"
}

variable "ecs_cluster_name" {
  type = string
  description = "Name of the ECS cluster"
  default = "rearc-quest-cluster"
}

variable "ecs_service_name" {
  type = string
  description = "Name of ECS service"
  default = "rearc-quest-service"
}

variable "ecs_task_definition_name" {
  type = string
  description = "Name of ECS task definition"
  default = "rearc-quest-task-definition"
}
