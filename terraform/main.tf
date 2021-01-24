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
  ssl_cert_body_file_path = var.ssl_cert_body_path
  ssl_cert_private_file_path = var.ssl_cert_private_file_path
  subnets = var.subnets
  vpc_id = var.vpc_id
  cidr = var.cidr
  lb_name = var.lb_name
  ssl_cert_name = var.ssl_cert_name
  lb_target_grp_name = var.lb_target_grp_name
  lb_security_group_name = var.lb_security_group_name
}

module "ecs" {
  source = "./ecs"
  ecr_url = module.ecr.ecr_url
  ecr_docker_image_version = var.ecr_docker_image_version
  subnets = var.subnets
  lb_sg_id = module.ec2.lb_sg_id
  alb_target_grp_arn_http = module.ec2.alb_target_grp_http_arn
  quest_secret_word = var.quest_secret_word
  ecs_cluster_name = var.ecs_cluster_name
  ecs_service_name = var.ecs_service_name
  ecs_task_definition_name = var.ecs_task_definition_name
}
