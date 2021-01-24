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
