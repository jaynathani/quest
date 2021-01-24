module "ecr" {
  source = "./ecr"
  ecr_repository_name = var.ecr_repository_name
}

module "s3" {
  source = "./s3"
  log_bucket_name = var.s3_bucket_name_for_ecs_logs
}

module "ec2" {
  source = "./ec2"
  s3_logs_bucket = module.s3.logs_bucket_id
  ssl_cert_body_file_path = "../../ssl-certs/v2/public.crt"
  ssl_cert_private_file_path = "../../ssl-certs/v2/privatekey.pem"
  subnets = ["subnet-f11d9697", "subnet-a2e77683"]
  vpc_id = "vpc-c67ed9bb"
}

module "ecs" {
  source = "./ecs"
  auto_scaling_grp_arn = module.ec2.asg_arn
  ecr_url = module.ecr.ecr_url
  subnets = ["subnet-f11d9697", "subnet-a2e77683"]
  lb_sg_id = module.ec2.lb_sg_id
  alb_target_grp_arn_http = module.ec2.alb_target_grp_http_arn
  alb_target_grp_arn_https = module.ec2.alb_target_grp_https_arn
  quest_secret_word = "TwelveFactor"
}
