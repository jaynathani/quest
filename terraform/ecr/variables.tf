variable "ecr_repository_name" {
  type        = string
  description = "Name of the Elastic Container Registry"
  default     = "rearc-quest-repo"
}

variable "ecr_docker_image_version" {
  type        = string
  description = "Docker image version for ECR image"
}

variable "local_docker_image_id" {
  type        = string
  description = "Local Docker image ID"
}
