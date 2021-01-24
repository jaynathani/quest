variable "alb_target_grp_arn_http" {
  type = string
  description = "Load balancer target group arn HTTP"
}

variable "alb_target_grp_arn_https" {
  type = string
  description = "Load balancer target group arn HTTPS"
}

variable "auto_scaling_grp_arn" {
  type = string
  description = "ASG arn"
}

variable "ecr_url" {
  type = string
  description = "URL of the ECR"
}

variable "subnets" {
  type = list(string)
  description = "List of subnets"
}

variable "lb_sg_id" {
  type = string
  description = "Load balancer security group id"
}

variable "quest_secret_word"{
  type = string
  description = "Secret word for rearc quest"
}
