variable "alb_target_grp_arn_http" {
  type        = string
  description = "Load balancer target group arn HTTP"
}

variable "ecr_url" {
  type        = string
  description = "URL of the ECR"
}

variable "ecr_docker_image_version" {
  type        = string
  description = "Docker image version"
}

variable "subnets" {
  type        = list(string)
  description = "List of subnets"
}

variable "lb_sg_id" {
  type        = string
  description = "Load balancer security group id"
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
