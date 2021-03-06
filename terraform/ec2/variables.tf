variable "cidr" {
  type        = list(string)
  description = "CIDR values for Security Group"
}

variable "lb_name" {
  type        = string
  description = "Name of Elastic Load Balancer"
  default     = "quest-lb"
}

variable "s3_logs_bucket" {
  type        = string
  description = "S3 bucket for logs"
}

variable "ssl_cert_name" {
  type        = string
  description = "Name of ssl certificate"
  default     = "quest-self-signed-ssl-cert"
}

variable "ssl_cert_body_file_path" {
  type        = string
  description = "File path with name of the ssl cert body"
}

variable "ssl_cert_private_file_path" {
  type        = string
  description = "File path with name of the ssl cert private key"
}

variable "subnets" {
  type        = list(string)
  description = "List of subnets to be attached to lb"
}

variable "lb_target_grp_name" {
  type        = string
  description = "Name of the LB target group"
  default     = "quest-lb-tg-grp"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "lb_security_group_name" {
  type        = string
  description = "Name of load balancer sg"
  default     = "quest_lb_sg"
}
