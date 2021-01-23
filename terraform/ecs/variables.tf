variable "alb_target_grp_arn" {
  type = string
  description = "Load balancer target group arn"
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
